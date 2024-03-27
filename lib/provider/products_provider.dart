import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopify/model/products_model.dart';
//import 'package:taskfromplacement/models/model1.dart';


class ProductProvider extends ChangeNotifier {
  static const apiEndpoints = 'http://143.198.61.94/api/products/';
  bool isloading = true;
  String error = '';

  Products products = Products(
    data: [],
  );

  //foods = Foods(categories: []);
  getDataFromApi() async {
    try {
      Response responseitem = await http.get(Uri.parse(apiEndpoints));

      if (responseitem.statusCode == 200) {
        // print("status code");
        products = productsFromJson(responseitem.body);

        print(products);
      } else {
        error = responseitem.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isloading = false;
    notifyListeners();
  }
}