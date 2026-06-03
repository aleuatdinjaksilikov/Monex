import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  final VoidCallback onClick;
  final double borderRadius;
  final String buttonText;
  const RoundedRectangleButton({super.key, required this.onClick,this.borderRadius = 12, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Text(buttonText, style: TextStyle(color: Colors.white)),
    );
  }
}
