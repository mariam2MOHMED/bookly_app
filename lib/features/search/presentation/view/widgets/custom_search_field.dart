import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(
        hintText: 'Search..',
        suffixIcon: Opacity(opacity: 0.7,
        child: Icon(Icons.search)),
        hintStyle: TextStyle(
          color: Colors.white
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),  borderSide: BorderSide(
            color: Colors.white,
            width: 1.5
        ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: Colors.white,
              width: 1.5
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5
          ),
            borderRadius: BorderRadius.circular(16.0)
        ),
        
      ),
    );
  }
}
