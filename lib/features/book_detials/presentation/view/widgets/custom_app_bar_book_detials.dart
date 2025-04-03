import 'package:flutter/material.dart';

class CustomBookDetialsAppBar extends StatelessWidget {
  const CustomBookDetialsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.close,
            color: Colors.white,size: 22,)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.shopping_cart_outlined,
                color: Colors.white,size: 22,)),
        ],
      ),
    );
  }
}
