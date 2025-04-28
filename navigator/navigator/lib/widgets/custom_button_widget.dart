import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? titleSize;
  final bool disabled;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.disabled = false,
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) return Colors.red;
          if (states.contains(WidgetState.pressed)) return Colors.blue;
          return Colors.green;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000000)),
        ),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) return TextStyle(fontSize: titleSize != null ? titleSize! * 2 : 28);
          return TextStyle(fontSize: titleSize);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return Colors.white;
        })
      ),
    );
  }
}
