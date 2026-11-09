# JWT Decoder API - PHP Package

JWT Decoder decodes JWT tokens to reveal header and payload information, and on paid plans verifies the signature against a public key you supply. It handles JSON web token decode from any language over REST, so you can inspect claims and expiry without adding a JWT library.

## Installation

Install via Composer:

```bash
composer require apiverve/jwtdecoder
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Jwtdecoder\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'token' => 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w',
    'publicKey' => '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx
Gyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa
KOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER
G+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv
uUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw
5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr
7QIDAQAB
-----END PUBLIC KEY-----'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Jwtdecoder\Client;
use APIVerve\Jwtdecoder\Exceptions\APIException;
use APIVerve\Jwtdecoder\Exceptions\ValidationException;

try {
    $response = $client->execute(['token' => 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w', 'publicKey' => '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx
Gyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa
KOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER
G+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv
uUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw
5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr
7QIDAQAB
-----END PUBLIC KEY-----']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "header": {
      "alg": "RS256",
      "typ": "JWT",
      "kid": "sample-key-1"
    },
    "payload": {
      "sub": "1234567890",
      "name": "John Doe",
      "iss": "https://auth.example.com",
      "aud": "api.example.com",
      "iat": 1767225600,
      "exp": 2082758400
    },
    "signature": "hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w",
    "isExpired": false,
    "expiresAt": "2036-01-01T00:00:00.000Z",
    "issuedAt": "2026-01-01T00:00:00.000Z",
    "tokenAge": "309 days",
    "algorithm": "RS256",
    "expiresIn": 288757380,
    "notYetValid": false,
    "securityAnalysis": {
      "isUnsecured": false,
      "hasExpiration": true,
      "isLongLived": true,
      "issues": [
        "Token lifetime exceeds 24 hours"
      ]
    },
    "warning": "Signature verified with the supplied public key.",
    "signatureVerification": {
      "verified": true,
      "algorithm": "RS256",
      "keyType": "RSA",
      "reason": null,
      "claimsValid": true,
      "claimsReason": null
    }
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jwtdecoder?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jwtdecoder?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jwtdecoder?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
