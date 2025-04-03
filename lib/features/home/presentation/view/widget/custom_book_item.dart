import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBooKItem extends StatelessWidget {
  const CustomBooKItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right:4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6/4, child: Image.asset(AssetsData.test,
          fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
