import "package:amri_systems_task/Controller/product_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SearchBarView extends StatefulWidget {
  final bool isAnimate;
  const SearchBarView({super.key, this.isAnimate = true});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  TextEditingController searchController = TextEditingController();
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return _buildSearchBar();
  }

  Widget _buildSearchBar() {
    return Center(
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.start,
        onChanged: (value) {
          productController.updateSearchText(value);
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: "Product name search here",
          isDense: true,
          prefixIcon: const Icon(Icons.search_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ).paddingSymmetric(horizontal: 5),
    );
  }
}

// import "package:amri_systems_task/Controller/product_controller.dart";
// import "package:amri_systems_task/Data/Models/product_model.dart";
// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
// import "package:get/get.dart";
// import "package:get/get_utils/get_utils.dart";
//
// class SearchBarView extends StatefulWidget {
//   final ProductModel? productModel;
//   final bool isAnimate;
//   const SearchBarView({super.key,this.isAnimate = true, this.productModel});
//
//   @override
//   State<SearchBarView> createState() => _SearchBarViewState();
// }
//
// class _SearchBarViewState extends State<SearchBarView> {
//
//   TextEditingController searchcontroller = TextEditingController();
//   ProductController productController = Get.put(ProductController());
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildSearchBar();
//   }
//
//   Widget _buildSearchBar() {
//     return Center(
//       child: TextField(
//         controller: searchcontroller,
//         textAlign: TextAlign.start,
//         onChanged: (value) {
//           productController.updateSearchText(value);
//         },
//         textAlignVertical: TextAlignVertical.center,
//         decoration: InputDecoration(
//           labelText: "Search",
//           isDense: true,
//           prefixIcon: const Icon(Icons.search_outlined),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(6),
//           )
//         ),
//       ).paddingSymmetric(horizontal: 5),
//     );
//   }
// }
