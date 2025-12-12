class SignupModel{
  final String message;
  final String email;

  SignupModel({
    required this.message,
    required this.email,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json){
  return SignupModel(
    message: json['message'] ?? '',
    email: json['email'] ?? '',
  );
}

  Map<String, dynamic> toJson(){
    return {
      'message':message,
      'email':email,
    };
  }
}

