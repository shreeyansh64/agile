class EmailStatus {
  final bool isEmail;
  final bool isVerified;

  EmailStatus({
    required this.isEmail,
    required this.isVerified,
  });

  factory EmailStatus.fromJson(Map<String, dynamic> json) {
    return EmailStatus(
      isEmail: json['is_email'],
      isVerified: json['is_verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_email': isEmail,
      'is_verified': isVerified,
    };
  }
}
