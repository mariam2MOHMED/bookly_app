import 'package:booklyapp/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBooKItem extends StatelessWidget {
  final String image;
   CustomBooKItem({ required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right:12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6/4, child: CachedNetworkImage(
          imageUrl: image,fit: BoxFit.fill,
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              )),
          errorWidget: (context, url, error) => Center(
            child: Icon(
                Icons.image_not_supported_rounded,
              color: Colors.white,),
          ),
        ),


        ),
      ),
    );
  }
}


