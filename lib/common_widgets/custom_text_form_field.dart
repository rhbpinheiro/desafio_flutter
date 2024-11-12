import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required TextEditingController passwordController,
    required bool isPasswordValid,
  })  : _passwordController = passwordController,
        _isPasswordValid = isPasswordValid;

  final TextEditingController _passwordController;
  final bool _isPasswordValid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      obscureText: true,
      validator: (password) {
        if (!_isPasswordValid) {
          return 'Sua senha deve atender as regras abaixo.';
        }
        return null;
      },
    );
  }
}
