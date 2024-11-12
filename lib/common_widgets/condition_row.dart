// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class ConditionRow extends StatelessWidget {
  final String condition;
  final bool isValid;
  final bool isPassword;

  const ConditionRow({
    Key? key,
    required this.condition,
    required this.isValid,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isPassword
            ? const SizedBox.shrink()
            : Icon(
                isValid ? Icons.check_circle : Icons.cancel,
                color: isValid ? Colors.green : Colors.red,
              ),
        const SizedBox(width: 10),
        Text(
          condition,
          style: TextStyle(
            color: isValid
                ? Colors.green
                : (isPassword ? Colors.white : Colors.red),
          ),
        ),
      ],
    );
  }
}
