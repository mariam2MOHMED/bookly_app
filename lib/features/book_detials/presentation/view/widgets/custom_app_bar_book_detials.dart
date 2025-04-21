import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetialsAppBar extends StatelessWidget {
  const CustomBookDetialsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
         GoRouter.of(context).pop();
          },
              icon: Icon(Icons.close,
            color: Colors.white,size: 22,)),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.kSavedBooksView);
          },
              icon: Icon(Icons.shopping_cart_outlined,
                color: Colors.white,size: 22,)),
        ],
      ),
    );
  }
}
