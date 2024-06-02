import 'package:amri_systems_task/Data/Models/product_model.dart';
import 'package:amri_systems_task/Presentation/Screens/Homepage/Widgets/static_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StaticAppBar(
              productname: "${widget.product?.title}",
            ).paddingSymmetric(
              vertical: 15,
              horizontal: 15,
            ),
            CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 2.3,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: widget.product?.images
                    ?.map((item) => Center(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.teal,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 6,
                                )
                              ]),
                          child: FadeInImage.assetNetwork(
                            placeholder: "asset/image/photo-gallery.png",
                            image: item,
                            width: 1000,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
                ).toList())
          ],
        ),
      ),
      bottomNavigationBar: bottomnavigationbar(),
    );
  }

  bottomnavigationbar() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.teal,
            blurRadius: 8,
            spreadRadius: 3,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${widget.product?.category}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "${widget.product?.title}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 3,
                  )),
                  Text(
                    "\$${widget.product?.price}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ).paddingOnly(right: 5),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "${widget.product?.description}",
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                    maxLines: 4,
                  ).paddingOnly(right: 5)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Product Stock : ${widget.product?.stock}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Warranty Information",
                    style: TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                  Text(
                    "${widget.product?.warrantyInformation}",
                    style: const TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Shipping Information",
                    style: TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                  Text(
                    "${widget.product?.shippingInformation}",
                    style: const TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "available Status",
                    style: TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                  Text(
                    "${widget.product?.availabilityStatus}",
                    style: const TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    "${widget.product?.rating}",
                    style: const TextStyle(fontSize: 13),
                    maxLines: 4,
                  ).paddingOnly(right: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
