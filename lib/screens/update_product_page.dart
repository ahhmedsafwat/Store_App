import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/widgets/custom_btn.dart';

import '../services/update_product.dart';
import '../widgets/custom_text_form_field.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                onChanged: (value) {
                  productName = value;
                },
                hintText: 'Product Mode',
              ),
              CustomTextField(
                onChanged: (value) {
                  desc = value;
                },
                hintText: 'Description',
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChanged: (value) {
                  price = value;
                },
                hintText: 'Price',
              ),
              CustomTextField(
                onChanged: (value) {
                  image = value;
                },
                hintText: 'Image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateproduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(ProductsModel product) async {
    await UpdaeProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
