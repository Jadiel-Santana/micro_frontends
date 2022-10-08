import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          icon: const Icon(Icons.home),
          label: const Text('Navigate to Home Page'),
          onPressed: () =>
              navigatorKey.currentState?.pushReplacementNamed('/home'),
        ),
      ),
    );
  }
}
