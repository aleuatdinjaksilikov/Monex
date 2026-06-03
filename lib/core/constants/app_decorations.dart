import 'package:flutter/material.dart';

BoxDecoration cardDecoration(BuildContext context){
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2),
        )
      ]
  );
}