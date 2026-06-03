import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:monex/config/routing/app_route.dart';
import 'package:monex/core/themes/app_theme.dart';

class MonexUzApp extends StatelessWidget {
  const MonexUzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Monex Uz',
      theme: AppTheme.lightMode,
      routerConfig: AppRoute.router,
    );
  }
}