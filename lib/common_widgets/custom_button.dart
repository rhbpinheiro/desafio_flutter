// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  // ignore: use_super_parameters
  const WidgetButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
              color: Colors.white,
            )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}
