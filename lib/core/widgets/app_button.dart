import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color bacgroundColor;
  final double borderRadius;
  final List<Widget> children;
  final bool withBorder;
  final double height;

  const AppButton({
    super.key,
    required this.onTap,
    required this.bacgroundColor,
    required this.children,
    this.borderRadius = 12, 
    this.withBorder = false, 
    this.height = 56
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(0, 223, 21, 21),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            border: withBorder ? Border.all(color: Colors.grey) : Border.all(color: Colors.transparent),
            color: bacgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: .center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
