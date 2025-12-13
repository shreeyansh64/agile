class SignupResponse {
  final String message;
  final String email;

  SignupResponse({required this.message, required this.email});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      SignupResponse(
        message: json['message'],
        email: json['email'],
      );
}
