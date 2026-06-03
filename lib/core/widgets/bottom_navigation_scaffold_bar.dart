import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScaffoldBar extends StatefulWidget {
  const BottomNavigationScaffoldBar({super.key, required this.navigationShell});


  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationScaffoldBar> createState() => _BottomNavigationScaffoldBar();
}

class _BottomNavigationScaffoldBar extends State<BottomNavigationScaffoldBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar : SafeArea(
            child: NavigationBar(
                backgroundColor: Colors.white.withValues(alpha: 0.95),
                elevation: 0,
                selectedIndex: widget.navigationShell.currentIndex,
                onDestinationSelected: (int index) {
                  widget.navigationShell.goBranch(index);
                },
                destinations: const <Widget>[
                  NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Главная'),
                  NavigationDestination(icon: Icon(Icons.contacts_outlined), label: 'Контакты'),
                  NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Настройки'),
                ]
            )
        )
    );
  }
}