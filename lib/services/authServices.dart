import 'package:agile/models/emailStatusModel.dart';
import 'package:agile/models/loginRequest.dart';
import 'package:agile/models/loginResponse.dart';
import 'package:agile/models/sendOtpRequest.dart';
import 'package:agile/models/signupRequestModel.dart';
import 'package:agile/models/signupResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ''));

  Future<SignupResponse> signup(SignupRequest request) async {
    try {
      final response = await _dio.post('/api/register/', data: request.toJson());
      return SignupResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Could not signup : $e');
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post('/api/login/', data: request.toJson());
      final res = LoginResponse.fromJson(response.data);
      var box = await Hive.openBox('auth');
      await box.put('access_token', res.accessToken);
      _dio.options.headers['Authorization'] = 'Bearer ${res.accessToken}';
      return res;
    } catch (e) {
      print('Error --------------------------------------------------------------------------> $e');
      print('username: ${request.username} ; password: ${request.password}');
      throw Exception('Could not login: $e');
    }
  }

  Future<EmailStatus> emailStatus(String email)async{
    try {
      final response = await _dio.post('/api/app/pre/',data: {"email": email});
      print("User : ${response.data['is_email']} , Verification : ${response.data['is_verified']}");
      return EmailStatus.fromJson(response.data);
    } catch (e) {
      print("Error ----> $e");
      throw Exception("Coundn't get the email Status : $e");
    }
  }

  Future<String?> getToken() async {
    var box = await Hive.openBox('auth');
    return box.get('access_token');
  }

  Future<bool> verifyOtp(String email, String otpCode) async {
  try {
    final response = await _dio.post(
      '/api/verify-registration/',
      data: {
        "email": email,
        "otp_code": otpCode,
        "purpose": "registration",
      },
    );
    return response.statusCode == 200;
  } catch (e) {
    print("Error verifying OTP: $e");
    return false;
  }
}

Future<bool> resendOtp(SendOtpRequest request) async {
  try {
    final response = await _dio.post('/api/resend-otp/', data: request.toJson());
    return response.statusCode == 200;
  } catch (e) {
    print("Resend OTP Error: $e");
    return false;
  }
}


}
