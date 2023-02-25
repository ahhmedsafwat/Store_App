import 'package:storeapp/constant.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdaeProductService {
  Future<ProductsModel> updateProduct({
    /// the title of the product
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
  }) async {
    print('product id = $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      "image": image,
      'category': category
    });

    return ProductsModel.fromJson(data);
  }
}
