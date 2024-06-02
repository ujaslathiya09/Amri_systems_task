import "dart:async";

import "package:flutter/material.dart";
import "package:nb_utils/nb_utils.dart";

class SearchBarView extends StatefulWidget {
  final bool isAnimate;
  const SearchBarView({super.key,this.isAnimate = true});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  List hintTextData = [
    "Spas & Salons",
    "Movie theater near me",
    "search for restaurants",
    "pest control services"
  ];
  int showThisHintText = 0;

  @override
  void initState() {
    if(!widget.isAnimate){
      hintTextData = ["shoes manufacture in surat"];
    }
    super.initState();
  if(widget.isAnimate)  WidgetsBinding.instance.addPostFrameCallback((_) => changeHintText());
  }

  @override
  Widget build(BuildContext context) {
    return _buildSearchBar();
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          _iconBuild(
            icon: Icons.search,
          ),
          _hintTextShow(),
          if(widget.isAnimate) _iconBuild(
            icon: Icons.qr_code_scanner_outlined,
          ),
          _iconBuild(
            icon: Icons.keyboard_voice_outlined,
          ),
        ],
      ).paddingSymmetric(horizontal: 5),
    );
  }

  Widget _iconBuild({required IconData icon}) {
    return Icon(
      icon,
      color: Colors.grey,
    ).paddingSymmetric(horizontal: 6);
  }

  Widget _hintTextShow() {
    return Expanded(
      child: Text(
        hintTextData[showThisHintText],
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  void changeHintText() {
    Duration duration = const Duration(seconds: 1,milliseconds: 200);
    Timer.periodic(duration, (timer) {
      if (timer.tick <= 3) {
        setState(() {
          showThisHintText++;
        });
      } else {
        setState(() {
          timer.cancel();
          showThisHintText = 0;
          changeHintText();
        });
      }
    });
  }
}
