import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class StaticAppBar extends StatefulWidget {
  final String productname;

  const StaticAppBar({super.key, required this.productname});

  @override
  State<StaticAppBar> createState() => _StaticAppBarState();
}

class _StaticAppBarState extends State<StaticAppBar> {
  @override
  Widget build(BuildContext context) {
    return _showproductname(name: widget.productname);
  }

  Widget _showproductname({required String name}) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Colors.teal,
          ),
        ),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.teal,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ).paddingSymmetric(horizontal: 15),
        ),
      ],
    );
  }
}
