class InputRegex {
  static final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$');
  static final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{1,40}$');
  static bool isPasswordValid(String password){
    return passwordRegex.hasMatch(password);
  }
  static bool isUsernameValid(String username){
    return usernameRegex.hasMatch(username);
  }
}