import 'dart:convert';

import 'package:http/http.dart';

import "../helper/api.dart";
import 'package:storeapp/constant.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategoies() async {
    List<dynamic> data = await Api().get(url: '$kApiPath/categories');

    return data;
  }
}
