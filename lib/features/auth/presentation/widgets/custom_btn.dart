import 'package:booklyapp/core/utils/constants.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class customBtnAuth extends StatelessWidget {
final Function()onPressed;final String txt;
   customBtnAuth({super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style:TextButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: Size(MediaQuery.of(context).size.width, 60),
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(20)
          )
        ) ,
        child: Center(
          child: Text(txt,style: Styles.text20.copyWith(
            color: Colors.black
          ),),
        ));
  }
}
