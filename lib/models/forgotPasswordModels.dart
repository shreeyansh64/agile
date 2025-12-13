class ForgotPasswordResponse {
  final String message;
  final String email;

  ForgotPasswordResponse({required this.message, required this.email});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json['message'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class ForgotPasswordRequest {
  final String email;

  ForgotPasswordRequest({required this.email});

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}

class VerifyResetOtpResponse {
  final String message;
  final String resetToken;
  final int expiresIn;

  VerifyResetOtpResponse({
    required this.message,
    required this.resetToken,
    required this.expiresIn,
  });

  factory VerifyResetOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResetOtpResponse(
      message: json['message'],
      resetToken: json['reset_token'],
      expiresIn: json['expires_in'],
    );
  }
}

class ResetOtpResponse {
  final String message;
  final String resetToken;
  final int expiresIn;

  ResetOtpResponse({
    required this.message,
    required this.resetToken,
    required this.expiresIn,
  });

  factory ResetOtpResponse.fromJson(Map<String, dynamic> json) {
    return ResetOtpResponse(
      message: json['message'],
      resetToken: json['reset_token'],
      expiresIn: json['expires_in'],
    );
  }
}
