import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

import '../../../login.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({
    super.key,
    required this.presenter,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: ValueListenableBuilder<LoginState>(
              valueListenable: widget.presenter,
              builder: (context, state, __) {
                if (state is LoadingState) {
                  return const CustomLoading();
                } else if (state is InitialState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        label: 'E-mail',
                        controller: widget.presenter.emailController,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 100,
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Senha',
                        controller: widget.presenter.passwordController,
                        obscureText: obscureText,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: isEmpty ? null : _onVisibilityButtonClick,
                          child: Icon(
                            obscureText ? Icons.visibility_off : Icons.visibility,
                            color: isEmpty ? AppColors.neutral3 : AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 390,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: (state.isFormValid) ? widget.presenter.login : null,
                          child: const Text(
                            'Entrar',
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        );
      }),
    );
  }

  bool get isEmpty => widget.presenter.passwordController.text.isEmpty;

  void _onVisibilityButtonClick() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
}
