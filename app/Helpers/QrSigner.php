<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Storage;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class QrSigner
{
    public static function gerarAssinatura(string $conteudo)
    {
        $privateKey = openssl_pkey_get_private(Storage::get('keys/qr_signer_private.pem'));
        openssl_sign($conteudo, $assinatura, $privateKey, OPENSSL_ALGO_SHA256);
        openssl_free_key($privateKey);
        return base64_encode($assinatura);
    }

    public static function gerarQrAssinado(array $dados)
    {
        $json = json_encode($dados, JSON_UNESCAPED_UNICODE);
        $assinatura = self::gerarAssinatura($json);

        $payload = [
            'dados' => $dados,
            'assinatura' => $assinatura,
        ];

        $qrContent = json_encode($payload, JSON_UNESCAPED_UNICODE);
        return QrCode::format('svg')->size(120)->generate($qrContent);
    }
}
