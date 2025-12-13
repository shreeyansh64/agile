import 'package:agile/models/loginRequest.dart';
import 'package:agile/models/loginResponse.dart';
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

  Future<String?> getToken() async {
    var box = await Hive.openBox('auth');
    return box.get('access_token');
  }
}
