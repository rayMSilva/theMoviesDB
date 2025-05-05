import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String labelDecoration;
  final bool obscureText;

  const CustomTextFieldWidget({
    super.key,
    required this.onChanged,
    required this.labelDecoration,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(labelDecoration)),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
