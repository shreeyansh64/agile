class InputRegex {
  static final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,15}$');
  static final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{1,15}$');
  static final emailRegex = RegExp(r'^[\w-\.]{1,15}@([\w-]+\.)+[\w-]{2,4}$');

  static bool isPasswordValid(String password) => passwordRegex.hasMatch(password);
  static bool isUsernameValid(String username) => usernameRegex.hasMatch(username);
  static bool isEmailValid(String email) => emailRegex.hasMatch(email);
}
