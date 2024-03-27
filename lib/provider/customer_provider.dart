import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../model/customer_model.dart';

class CustomerProvide extends ChangeNotifier {
  static const apiEndpoint =
      "http://143.198.61.94/api/customers/";
  bool isLoading = true;
  String error = "";
  Customer customer = Customer(data: []);

  getCustomerAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        customer = Customer.fromJson(response.body as Map<String, dynamic>);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}