import 'dart:developer';
import 'package:amri_systems_task/Data/Models/product_model.dart';
import 'package:amri_systems_task/Data/Repository/homepage_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  ProductModel? productModel;
  var searchText = ''.obs;
  var filteredProducts = <Product>[].obs;
  ProductPageRepo productPageRepo = ProductPageRepo();

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
    searchText.listen((value) {
      filterItems();
    });
  }

  void filterItems() {
    if (searchText.value.isEmpty) {
      filteredProducts.value = productModel?.products ?? [];
    } else {
      filteredProducts.value = productModel?.products
          ?.where((product) =>
          product.title!.toLowerCase().contains(searchText.value.toLowerCase()))
          .toList() ?? [];
    }
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }

  fetchData() async {
    try {
      isLoading(true);
      log("Fetching data...");
      productModel = await productPageRepo.fetchProductDetails();
      filteredProducts.value = productModel?.products ?? [];
      log("Fetched ${productModel?.products?.length} products");
    } catch (e) {
      log('Error while getting data: $e');
    } finally {
      isLoading(false);
    }
  }
}

