import 'package:agile/models/emailStatusModel.dart';
import 'package:agile/models/forgotPasswordModels.dart';
import 'package:agile/models/loginRequest.dart';
import 'package:agile/models/loginResponse.dart';
import 'package:agile/models/sendOtpRequest.dart';
import 'package:agile/models/signupRequestModel.dart';
import 'package:agile/models/signupResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
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
      await box.put('refresh_token', res.refreshToken);
      _dio.options.headers['Authorization'] = 'Bearer ${res.accessToken}';
      return res;
    } catch (e) {
      print('Error --------------------------------------------------------------------------> $e');
      print('username: ${request.username} ; password: ${request.password}');
      throw Exception('Could not login: $e');
    }
  }

  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request) async {
    try {
      final response = await _dio.post('/api/forget-password/', data: request.toJson());
      return ForgotPasswordResponse.fromJson(response.data);
    } catch (e) {
      print("Forgot Password Error: $e");
      throw Exception("Could not send password reset email: $e");
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

  Future<ResetOtpResponse?> verifyResetOtp(String email, String otp) async {
  try {
    final response = await _dio.post(
      '/api/verify-reset-otp/',
      data: {
        'email': email,
        'otp': otp,
      },
    );
    if (response.statusCode == 200) {
      return ResetOtpResponse.fromJson(response.data);
    }
    return null;
  } catch (e) {
    print("Error verifying reset OTP: $e");
    return null;
  }
}

  Future<LoginResponse> googleLogin() async {
  try {
    final authUrlResponse = await _dio.get('/api/auth/google/login/', 
      queryParameters: {'platform': 'mobile'}
    );
    final authUrl = authUrlResponse.data as String;
    
    final result = await FlutterWebAuth2.authenticate(
      url: authUrl,
      callbackUrlScheme: 'com.agile.app',
    );
    
    final uri = Uri.parse(result);
    final code = uri.queryParameters['code'];
    final state = uri.queryParameters['state'];
    
    if (code == null) throw Exception('No code received');
    
    final response = await _dio.post(
      '/api/auth/google/callback/',
      queryParameters: {'platform': 'mobile'},
      data: {
        'code': code,
        'state': state,
      },
    );
    
    final res = LoginResponse.fromJson(response.data);
    var box = await Hive.openBox('auth');
    await box.put('access_token', res.accessToken);
    await box.put('refresh_token', res.refreshToken);
    _dio.options.headers['Authorization'] = 'Bearer ${res.accessToken}';
    
    return res;
  } catch (e) {
    print('Google Login Error: $e');
    throw Exception('Could not login with Google: $e');
  }
}


  Future<bool> verifyOtp(String email, String otpCode) async {
  try {
    print('Sending OTP verification:');
    print('Email: $email');
    print('OTP: $otpCode');
    print('Purpose: registration');
    
    final response = await _dio.post(
      '/api/verify-registration/',
      data: {
        "email": email,
        "otp_code": otpCode,
        "purpose": "registration",
      },
    );
    
    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');
    return response.statusCode == 200;
  } catch (e) {
    print("Error verifying OTP: $e");
    if (e is DioException) {
      print('Error response: ${e.response?.data}');
      print('Error status: ${e.response?.statusCode}');
    }
    return false;
  }
}

Future<bool> completeReset(String resetToken, String password, String password2) async {
  try {
    final response = await _dio.put(
      '/api/complete-reset/',
      data: {
        'reset_token': resetToken,
        'password': password,
        'password2': password2,
      },
    );
    return response.statusCode == 200;
  } catch (e) {
    print("Complete Reset Error: $e");
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
