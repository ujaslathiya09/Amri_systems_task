import 'dart:developer';

import 'package:amri_systems_task/Controller/product_controller.dart';
import 'package:amri_systems_task/Presentation/Screens/Homepage/Widgets/hader_bar.dart';
import 'package:amri_systems_task/Presentation/Screens/Homepage/Widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/search_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    log("Lenght ---> ${productController.productModel?.products?.length}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const AppBarView().paddingOnly(top: 25,left: 15,right: 15),
              const SearchBarView().paddingOnly(top: 15,bottom: 15,left: 15,right: 15),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: SingleChildScrollView(scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Obx(
                      () => productController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: height / 1.3,
                        width: width,
                            child: ProductList(
                                productModel: productController.productModel).paddingOnly(top: 5,bottom: 5,left: 5,right: 5),
                          ),
                    ).paddingSymmetric(
                      // horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
