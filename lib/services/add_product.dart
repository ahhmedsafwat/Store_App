import 'package:http/http.dart';
import 'package:storeapp/constant.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class AppProductService {
  Future<ProductsModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(url: kApiPath, body: {
      'title': title,
      'price': price,
      'description': desc,
      "image": image,
      'category': category
    });

    return ProductsModel.fromJson(data);
  }
}
