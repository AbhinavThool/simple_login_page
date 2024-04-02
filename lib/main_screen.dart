import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to HomeScreen',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
