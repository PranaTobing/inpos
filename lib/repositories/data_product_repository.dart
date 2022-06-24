import 'package:inpos/models/product_model.dart';
import 'package:inpos/providers/data_product_provider.dart';

class DataProductRepository {
  final _provider = DataProductProvider();

  Future<ProductModel> fetchProductList() {
    return _provider.fetchProductList();
  }
}
