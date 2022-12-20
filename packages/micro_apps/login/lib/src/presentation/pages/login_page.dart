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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder<LoginState>(
          valueListenable: widget.presenter,
          builder: (context, state, __) {
            if (state is LoadingState) {
              return const CustomLoading();
            } else if (state is InitialState) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  onChanged: widget.presenter.onFormChanged,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: widget.presenter.emailController,
                        validator: widget.presenter.emailController.validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(labelText: 'E-mail'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: widget.presenter.passwordController,
                        validator: widget.presenter.passwordController.validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(labelText: 'Senha'),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 390,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: state.isFormValid ? widget.presenter.login : null,
                          child: const Text('Entrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
