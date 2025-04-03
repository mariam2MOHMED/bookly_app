import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 18,right: 18,top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/Logo.png",height: 18,),
      IconButton(onPressed: (){
        GoRouter.of(context).push(AppRouter.kSearchView);
      },
        icon:  Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,
        size: 24,),)

        ],
      ),
    );
  }
}
