declare module '@apiverve/jwtdecoder' {
  export interface jwtdecoderOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface jwtdecoderResponse {
    status: string;
    error: string | null;
    data: JWTDecoderData;
    code?: number;
  }


  interface JWTDecoderData {
      header:    Header;
      payload:   Payload;
      signature: string;
      isExpired: boolean;
      expiresAt: null;
      warning:   string;
  }
  
  interface Header {
      alg: string;
      typ: string;
  }
  
  interface Payload {
      sub:  string;
      name: string;
      iat:  number;
  }

  export default class jwtdecoderWrapper {
    constructor(options: jwtdecoderOptions);

    execute(callback: (error: any, data: jwtdecoderResponse | null) => void): Promise<jwtdecoderResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jwtdecoderResponse | null) => void): Promise<jwtdecoderResponse>;
    execute(query?: Record<string, any>): Promise<jwtdecoderResponse>;
  }
}
