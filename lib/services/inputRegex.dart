class InputRegex {
  static final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$');
  static final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{1,40}$');
  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isPasswordValid(String password) => passwordRegex.hasMatch(password);
  static bool isUsernameValid(String username) => usernameRegex.hasMatch(username);
  static bool isEmailValid(String email) => emailRegex.hasMatch(email);
}
