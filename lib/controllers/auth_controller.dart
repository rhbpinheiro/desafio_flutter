// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_flutter/models/api_response.dart';
import 'package:desafio_flutter/services/auth_service.dart';

class AuthController {
  Future<ApiResponse> login(String password) async {
    final authService = AuthService();

    final response = await authService.validatePasswordWithApi(password);

    return response!;
  }
}
