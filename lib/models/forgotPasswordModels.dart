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


