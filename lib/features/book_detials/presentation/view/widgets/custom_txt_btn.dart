import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTxtBtn extends StatelessWidget {
   CustomTxtBtn({
     required this.txt,
     required this.bg,
     required this.txtColor,
      this.radius,
     required this.onPressed,
});
final Function()onPressed;
final Color bg;
final Color txtColor;
final String txt;
final BorderRadius? radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextButton(
          style:TextButton.styleFrom(
            backgroundColor: bg,
            shape: RoundedRectangleBorder(
              borderRadius: radius!
            )
          ) ,
          onPressed: onPressed,
          child: Text(txt,style:
          Styles.text18.copyWith(
            color: txtColor,

          ),)),
    );
  }
}
