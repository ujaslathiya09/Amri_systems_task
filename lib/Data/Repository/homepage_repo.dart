import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/product_model.dart';

abstract class ProductPageRepository {
  Future<ProductModel> fetchProductDetails();
}

class ProductPageRepo extends ProductPageRepository {
  @override
  Future<ProductModel> fetchProductDetails() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      log("body --> ${response.body}");
      var result = jsonDecode(response.body);
      return ProductModel.fromJson(result);
    } else {
      debugPrint("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
