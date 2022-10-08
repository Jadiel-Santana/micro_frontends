import 'package:flutter/material.dart';

import '../../../splash.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;

  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
