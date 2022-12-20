import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;

  const CustomLoading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}
