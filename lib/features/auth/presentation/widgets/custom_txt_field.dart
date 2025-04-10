import 'package:booklyapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTxtField extends StatefulWidget {
 final String hint;final IconData prefixIcon;final bool isPassword;
final TextEditingController controller;
 const CustomTxtField({
     required this.hint, required this.prefixIcon,
      this.isPassword=false, required this.controller});

  @override
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

class _CustomTxtFieldState extends State<CustomTxtField> {
  bool obsecure=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
        color: Colors.white
      ),
obscureText: obsecure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: widget.hint,

          filled: true,
          fillColor: Colors.white12,
        prefixIcon: Icon(widget.prefixIcon,
  color: Colors.white,),
        suffixIcon: widget.isPassword==true?
        IconButton(onPressed: (){
          obsecure=!obsecure;
          setState(() {

          });
        },
            icon: Icon(obsecure==true?
            Icons.visibility:Icons.visibility_off,color: Colors.white,))
            :null,

        hintStyle: TextStyle(
          fontSize: 16.0,fontWeight: FontWeight.w500,
          color: Colors.white
        ),
        focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.white12,

            ),
            borderRadius: BorderRadius.circular(16)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.white12,

            ),
            borderRadius: BorderRadius.circular(16)
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:  Colors.white12,

          ),
          borderRadius: BorderRadius.circular(16)
        )
      ),
    );
  }
}
