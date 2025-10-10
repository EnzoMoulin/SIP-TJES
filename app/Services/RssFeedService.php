<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;

class RssFeedService
{
    /**
     * Fetch and parse RSS/Atom feed, return array of items.
     *
     * @param string $url
     * @param int $limit
     * @param int $ttlSeconds
     * @return array
     */
    public function get(string $url, int $limit = 5, int $ttlSeconds = 300): array
    {
        $cacheKey = 'rss:' . md5($url) . ':' . $limit;

        return Cache::remember($cacheKey, $ttlSeconds, function () use ($url, $limit) {
            try {
                $resp = Http::timeout(10)->get($url);
                if (! $resp->successful()) {
                    return [];
                }

                $body = $resp->body();
                $xml = @simplexml_load_string($body, 'SimpleXMLElement', LIBXML_NOCDATA);
                if (! $xml) {
                    return [];
                }

                $items = [];

                // RSS 2.0: channel->item
                if (isset($xml->channel->item)) {
                    foreach ($xml->channel->item as $i => $item) {
                        if ($i >= $limit) break;
                        $items[] = [
                            'title'   => (string) $item->title,
                            'link'    => (string) $item->link,
                            'pubDate' => (string) $item->pubDate,
                            'summary' => $this->excerpt((string) ($item->description ?? '')),
                        ];
                    }
                }
                // Atom: entry
                elseif (isset($xml->entry)) {
                    foreach ($xml->entry as $i => $entry) {
                        if ($i >= $limit) break;
                        // link may be attribute
                        $link = '';
                        if (isset($entry->link['href'])) {
                            $link = (string) $entry->link['href'];
                        } else {
                            foreach ($entry->link as $l) {
                                $attrs = $l->attributes();
                                if (isset($attrs['href'])) {
                                    $link = (string) $attrs['href'];
                                    break;
                                }
                            }
                        }
                        $items[] = [
                            'title'   => (string) $entry->title,
                            'link'    => $link,
                            'pubDate' => (string) ($entry->updated ?? $entry->published ?? ''),
                            'summary' => $this->excerpt((string) ($entry->summary ?? $entry->content ?? '')),
                        ];
                    }
                }

                return $items;
            } catch (\Throwable $e) {
                // optionally log error
                return [];
            }
        });
    }

    private function excerpt(string $html, int $length = 140): string
    {
        $text = strip_tags($html);
        $text = trim(preg_replace('/\s+/', ' ', $text));
        if (mb_strlen($text) <= $length) return $text;
        return mb_substr($text, 0, $length - 1) . '…';
    }
}
