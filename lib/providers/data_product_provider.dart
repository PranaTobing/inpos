import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:inpos/models/product_model.dart';

class DataProductProvider {
  Future<ProductModel> fetchProductList() async {
    String jsonText = await rootBundle
        .loadString('assets/example_data/data_product_groceries.json');
    final Map<String, dynamic> data = await json.decode(jsonText);
    return ProductModel.fromJson(data);
  }
}
