import 'package:dependencies/dependencies.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../models/models.dart';

class RemoteFetchProducts implements FetchProductsUsecase {

  @override
  Future<List<ProductEntity>> call() async {
    try {
      final result = await Dio().get('https://fakestoreapi.com/products');
      return (result.data as List)
        .map((e) => ProductModel.fromMap(map: e))
        .toList();
    } catch (error) {
      return [];
    }
  }
}
