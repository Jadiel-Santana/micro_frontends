import 'package:flutter/material.dart';

import 'package:micro_core/micro_core.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../../home.dart';

class HomePresenter extends ValueNotifier<HomeState> {
  final FetchProductsUsecase fetchProductsUsecase;
  final AppNavigator appNavigator;

  HomePresenter({
    required this.fetchProductsUsecase,
    required this.appNavigator,
  }) : super(HomeState.initial());

  Future<void> fetchProducts() async {
    try {
      value = HomeState.loading();
      List<ProductEntity> products = await fetchProductsUsecase();
      value = HomeState.success(products: products);
    } catch (e) {
      value = HomeState.error(message: e.toString());
    }
  }
}
