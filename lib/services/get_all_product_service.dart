import 'dart:convert';

import 'package:http/http.dart';
import 'package:storeapp/constant.dart';
import 'package:storeapp/models/product_model.dart';
import "../helper/api.dart";

class AllProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    // the request that brings the data from the api
    List<dynamic> data = await Api().get(url: kApiPath);

    // where we store the entire map of the items
    List<ProductsModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }

    return productsList;
  }
}
