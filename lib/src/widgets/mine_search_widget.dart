import 'package:flutter/material.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';
import 'package:ravi_launcher/src/controllers/mine_search_controller.dart';

class MineSearchWidget extends StatelessWidget {
  const MineSearchWidget({super.key, required this.searchController});

  final MineSearchController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: searchController.searchCtrl.value,
        cursorColor: primaryTextColor,
        autocorrect: true,
        style: TextStyle(color: primaryTextColor),
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () => searchController.searchApp(),
              child: Icon(Icons.search, color: primaryTextColor)),
          hintText: 'Search',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(200),
              borderSide: BorderSide(color: primaryTextColor)),
          hintStyle:
              TextStyle(color: primaryTextColor, fontWeight: FontWeight.normal),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
        ));
  }
}