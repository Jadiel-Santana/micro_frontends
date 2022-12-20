import 'package:flutter/material.dart';

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
      body: ValueListenableBuilder<LoginState>(
          valueListenable: widget.presenter,
          builder: (context, state, __) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InitialState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  onChanged: widget.presenter.onFormChanged,
                  child: Column(
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
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: state.isFormValid ? widget.presenter.login : null,
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          }),
    );
  }
}
