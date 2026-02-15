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
    }
}
