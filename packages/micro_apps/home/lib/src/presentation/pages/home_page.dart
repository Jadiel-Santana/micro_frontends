import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

import '../../../home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: widget.presenter,
              builder: (_, state, __) {
                if (state is InitialState) {
                  return const Text(
                    'Contador não iniciado',
                    style: AppTextTheme.subtitle1,
                  );
                } else if (state is CounterState) {
                  return Text(
                    'Você clicou no botão\n${state.counter} vezes',
                    textAlign: TextAlign.center,
                    style: AppTextTheme.subtitle1,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.presenter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
