import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Home Page'),
          onPressed: () => navigatorKey.currentState?.pushReplacementNamed('/home'),
        ),
      ),
    );
  }
}
