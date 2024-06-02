import 'package:amri_systems_task/Controller/change_icons_controller.dart';
import 'package:amri_systems_task/Controller/product_controller.dart';
import 'package:amri_systems_task/Data/Models/product_model.dart';
import 'package:amri_systems_task/Presentation/Screens/Homepage/UI/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  final ProductModel? productModel;

  const ProductList({super.key, required this.productModel});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final IconController iconController = Get.put(IconController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        var products = productController.filteredProducts;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.760,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(products[index], index);
          },
        );
      }
    });
  }

  Widget _buildProductCard(Product product, int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product),));
          },
          child: Card(
            elevation: 10,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            clipBehavior: Clip.hardEdge,
            shadowColor: Colors.grey,
            margin: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: product)));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.brand ?? '',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        GetBuilder<IconController>(
                          builder: (iconController) => GestureDetector(
                            onTap: () {
                              iconController.toggleIcon(index);
                            },
                            child: Obx(
                                  () => Icon(
                                iconController.isIconChanged[index] ?? false
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 8, vertical: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.100,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: product)));
                        },
                        child: FadeInImage.assetNetwork(
                            placeholder: "asset/image/photo-gallery.png",
                            image: "${product.images?[0]}"),
                      ),
                    ),
                    _buildText(name: "${product.title}")
                        .paddingSymmetric(horizontal: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.brand ?? '',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5),
                    Row(
                      children: [
                        const Text(
                          "₹",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${product.price}",
                          style: const TextStyle(fontSize: 15, color: Colors.teal),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 20,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                                  "-${product.discountPercentage} % OFF",
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )))
                      ],
                    ).paddingSymmetric(horizontal: 5),
                  ],
                ).paddingSymmetric(vertical: 5),
              ),
            ),
          ).paddingSymmetric(horizontal: 10),
        ),
        Positioned(
          bottom: 58,
          right: 0,
          child: _buildStackIcon(icon: Icons.local_phone_outlined),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          child: _buildStackIcon(
            icon: Icons.arrow_forward_outlined,
          ),
        ),
      ],
    );
  }

  Widget _buildText({required String name}) {
    return Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );
  }


  Widget _buildStackIcon({required IconData icon}) {
    return GestureDetector(
      onTap: () {
        // const ProductDetailScreen().launch(context);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.7))),
        child: Icon(
          icon,
          size: 17,
        ),
      ),
    );
  }
}
