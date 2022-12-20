import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../../../home.dart';

class HomePresenter extends ValueNotifier<HomeState> {
  final AppNavigator appNavigator;

  HomePresenter({
    required this.appNavigator,
  }) : super(HomeState.initial());

  Future<void> fetchHomePage() async {
    // await Future.delayed(const Duration(seconds: 3));
    // appNavigator.pushReplacement(AppRoutes.loginPage);
  }

  void increment() {
    final state = value;

    if (state is InitialState) {
      value = HomeState.counter(counter: 1);
    } else if (state is CounterState) {
      value = HomeState.counter(counter: state.counter + 1);
    }
  }

  void decrement() {
    value = HomeState.counter(counter: (value as CounterState).counter - 1);
  }
}
