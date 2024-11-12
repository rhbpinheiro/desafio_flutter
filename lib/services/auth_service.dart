// services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';

class AuthService {
  Future<ApiResponse?> validatePasswordWithApi(String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://desafioflutter-api.modelviewlabs.com/validate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'password': password}),
      );

      if (response.statusCode == 202) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Senha inválida. Tente novamente.');
      }
    } catch (e) {
      throw Exception('Erro de rede. Tente novamente.');
    }
  }


}
