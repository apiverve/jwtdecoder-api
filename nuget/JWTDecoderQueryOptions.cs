using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.JWTDecoder
{
    /// <summary>
    /// Query options for the JWT Decoder API
    /// </summary>
    public class JWTDecoderQueryOptions
    {
        /// <summary>
        /// JWT token to decode
        /// </summary>
        [JsonProperty("token")]
        public string Token { get; set; }

        /// <summary>
        /// Public key to verify the signature with: a PEM public key, a PEM X.509 certificate, or a JWK (as a JSON object or string). Asymmetric algorithms only; HMAC secrets are refused and keys are never fetched from URLs. Omit it to decode only.
        /// </summary>
        [JsonProperty("publicKey")]
        public string PublicKey { get; set; }
    }
}
