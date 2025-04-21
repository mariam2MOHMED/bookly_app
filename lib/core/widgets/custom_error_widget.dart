import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
   CustomErrorWidget({ required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error,style: Styles.text20,));
  }
}
