// import 'package:flutter/material.dart';
// import 'package:get/get_utils/get_utils.dart';
//
// class ImagesView extends StatelessWidget {
//   final String imagesData;
//
//   const ImagesView({super.key, required this.imagesData});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.network(imagesData).paddingSymmetric(horizontal: 60),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildDot(color: Colors.blue.shade400),
//             _buildDot(color: Colors.blue.shade200),
//             _buildDot(color: Colors.blue.shade200),
//             _buildDot(color: Colors.blue.shade200),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDot({required Color color}) {
//     return Container(
//       height: 8,
//       width: 8,
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//     ).paddingSymmetric(horizontal: 2);
//   }
// }
