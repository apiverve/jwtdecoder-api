/// Response models for the JWT Decoder API.

/// API Response wrapper.
class JwtdecoderResponse {
  final String status;
  final dynamic error;
  final JwtdecoderData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  JwtdecoderResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory JwtdecoderResponse.fromJson(Map<String, dynamic> json) => JwtdecoderResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JwtdecoderData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the JWT Decoder API.

class JwtdecoderData {
  JwtdecoderDataHeader? header;
  JwtdecoderDataPayload? payload;
  String? signature;
  bool? isExpired;
  String? expiresAt;
  String? issuedAt;
  String? tokenAge;
  String? algorithm;
  num? expiresIn;
  bool? notYetValid;
  JwtdecoderDataSecurityanalysis? securityAnalysis;
  String? warning;
  JwtdecoderDataSignatureverification? signatureVerification;

  JwtdecoderData({
    this.header,
    this.payload,
    this.signature,
    this.isExpired,
    this.expiresAt,
    this.issuedAt,
    this.tokenAge,
    this.algorithm,
    this.expiresIn,
    this.notYetValid,
    this.securityAnalysis,
    this.warning,
    this.signatureVerification,
  });

  factory JwtdecoderData.fromJson(Map<String, dynamic> json) => JwtdecoderData(
      header: json['header'] != null ? JwtdecoderDataHeader.fromJson(json['header']) : null,
      payload: json['payload'] != null ? JwtdecoderDataPayload.fromJson(json['payload']) : null,
      signature: json['signature'],
      isExpired: json['isExpired'],
      expiresAt: json['expiresAt'],
      issuedAt: json['issuedAt'],
      tokenAge: json['tokenAge'],
      algorithm: json['algorithm'],
      expiresIn: json['expiresIn'],
      notYetValid: json['notYetValid'],
      securityAnalysis: json['securityAnalysis'] != null ? JwtdecoderDataSecurityanalysis.fromJson(json['securityAnalysis']) : null,
      warning: json['warning'],
      signatureVerification: json['signatureVerification'] != null ? JwtdecoderDataSignatureverification.fromJson(json['signatureVerification']) : null,
    );
}

class JwtdecoderDataHeader {
  String? alg;
  String? typ;
  String? kid;

  JwtdecoderDataHeader({
    this.alg,
    this.typ,
    this.kid,
  });

  factory JwtdecoderDataHeader.fromJson(Map<String, dynamic> json) => JwtdecoderDataHeader(
      alg: json['alg'],
      typ: json['typ'],
      kid: json['kid'],
    );
}

class JwtdecoderDataPayload {
  String? sub;
  String? name;
  String? iss;
  String? aud;
  num? iat;
  num? exp;

  JwtdecoderDataPayload({
    this.sub,
    this.name,
    this.iss,
    this.aud,
    this.iat,
    this.exp,
  });

  factory JwtdecoderDataPayload.fromJson(Map<String, dynamic> json) => JwtdecoderDataPayload(
      sub: json['sub'],
      name: json['name'],
      iss: json['iss'],
      aud: json['aud'],
      iat: json['iat'],
      exp: json['exp'],
    );
}

class JwtdecoderDataSecurityanalysis {
  bool? isUnsecured;
  bool? hasExpiration;
  bool? isLongLived;
  List<String>? issues;

  JwtdecoderDataSecurityanalysis({
    this.isUnsecured,
    this.hasExpiration,
    this.isLongLived,
    this.issues,
  });

  factory JwtdecoderDataSecurityanalysis.fromJson(Map<String, dynamic> json) => JwtdecoderDataSecurityanalysis(
      isUnsecured: json['isUnsecured'],
      hasExpiration: json['hasExpiration'],
      isLongLived: json['isLongLived'],
      issues: (json['issues'] as List?)?.cast<String>(),
    );
}

class JwtdecoderDataSignatureverification {
  bool? verified;
  String? algorithm;
  String? keyType;
  dynamic reason;
  bool? claimsValid;
  dynamic claimsReason;

  JwtdecoderDataSignatureverification({
    this.verified,
    this.algorithm,
    this.keyType,
    this.reason,
    this.claimsValid,
    this.claimsReason,
  });

  factory JwtdecoderDataSignatureverification.fromJson(Map<String, dynamic> json) => JwtdecoderDataSignatureverification(
      verified: json['verified'],
      algorithm: json['algorithm'],
      keyType: json['keyType'],
      reason: json['reason'],
      claimsValid: json['claimsValid'],
      claimsReason: json['claimsReason'],
    );
}

class JwtdecoderRequest {
  String token;
  String? publicKey;

  JwtdecoderRequest({
    required this.token,
    this.publicKey,
  });

  Map<String, dynamic> toJson() => {
      'token': token,
      if (publicKey != null) 'publicKey': publicKey,
    };
}
