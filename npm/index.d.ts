declare module '@apiverve/jwtdecoder' {
  export interface jwtdecoderOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface jwtdecoderResponse {
    status: string;
    error: string | null;
    data: JWTDecoderData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface JWTDecoderData {
      header:           Header;
      payload:          Payload;
      signature:        null | string;
      isExpired:        boolean | null;
      expiresAt:        null;
      issuedAt:         Date | null;
      tokenAge:         null | string;
      algorithm:        null | string;
      expiresIn:        null;
      notYetValid:      boolean | null;
      securityAnalysis: SecurityAnalysis;
      warning:          null | string;
  }
  
  interface Header {
      alg: null | string;
      typ: null | string;
  }
  
  interface Payload {
      sub:  null | string;
      name: null | string;
      iat:  number | null;
  }
  
  interface SecurityAnalysis {
      isUnsecured:   boolean | null;
      hasExpiration: boolean | null;
      isLongLived:   boolean | null;
      issues:        (null | string)[];
  }

  export default class jwtdecoderWrapper {
    constructor(options: jwtdecoderOptions);

    execute(callback: (error: any, data: jwtdecoderResponse | null) => void): Promise<jwtdecoderResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jwtdecoderResponse | null) => void): Promise<jwtdecoderResponse>;
    execute(query?: Record<string, any>): Promise<jwtdecoderResponse>;
  }
}
