class SignupRequest {
  final String email;
  final String password;
  final String password2;
  final String username;

  SignupRequest({
    required this.email,
    required this.password,
    required this.password2,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "password2": password2,
    "username": username,
  };
}
