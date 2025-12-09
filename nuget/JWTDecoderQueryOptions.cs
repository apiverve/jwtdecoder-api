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
        /// Example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
        /// </summary>
        [JsonProperty("token")]
        public string Token { get; set; }
    }
}
