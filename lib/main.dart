import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:monex/monex_uz_app/monex_uz_app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MonexUzApp()
    )
  );
}



