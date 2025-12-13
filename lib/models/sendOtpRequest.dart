class SendOtpRequest {
  final String email;
  final String purpose;

  SendOtpRequest({required this.email, required this.purpose});
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "purpose": purpose,
    };
  }
  factory SendOtpRequest.fromJson(Map<String, dynamic> json) {
    return SendOtpRequest(
      email: json['email'] as String,
      purpose: json['purpose'] as String,
    );
  }
}
