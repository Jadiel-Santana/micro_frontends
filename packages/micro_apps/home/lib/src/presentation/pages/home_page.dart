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
  void initState() {
    widget.presenter.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: ValueListenableBuilder(
                valueListenable: widget.presenter,
                builder: (_, state, __) {
                  if (state is LoadingState) {
                    return const Center(child: CustomLoading());
                  } else if (state is InitialState) {
                    return const Center(
                      child: Text(
                        'Nenhum produto encontrado',
                        style: AppTextTheme.subtitle1,
                      ),
                    );
                  } else if (state is ErrorState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: AppTextTheme.subtitle1.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    );
                  } else if (state is SuccessState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.products.length,
                      itemBuilder: (_, index) {
                        return ProductCard(
                          product: state.products[index],
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
