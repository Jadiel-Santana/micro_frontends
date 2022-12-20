import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

import '../../../splash.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashPage({
    super.key,
    required this.presenter,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    widget.presenter.goToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
