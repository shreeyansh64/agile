import 'package:agile/models/signupRequestModel.dart';
import 'package:agile/models/signupResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ''));

  Future<SignupResponse> signup(SignupRequest request) async {
    try {
      final response = await _dio.post(
        '/api/register/',
        data: request.toJson(),
      );
      return SignupResponse.fromJson(response.data);
    } catch (e) {
      print('-------------> Error: $e');
      return throw Exception('Could not signup : $e');
    }
  }
}
