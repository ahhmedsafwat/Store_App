import 'dart:convert';

import 'package:http/http.dart';
import 'package:storeapp/constant.dart';
import 'package:storeapp/models/product_model.dart';
import "../helper/api.dart";

class CategoriesService {
  Future<List<ProductsModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data =
        await Api().get(url: '$kApiPath/category/$categoryName');

    List<ProductsModel> categoryList = [];

    for (var i = 0; i < data.length; i++) {
      categoryList.add(ProductsModel.fromJson(data[i]));
    }
    return categoryList;
  }
}
