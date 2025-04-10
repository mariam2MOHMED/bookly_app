import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class noSearchItems extends StatelessWidget {
   noSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         SizedBox(height:MediaQuery.of(context).size.height*0.4,),
         Icon(FontAwesomeIcons.thinkPeaks,size: 50.0,color: Colors.white,) ,
         SizedBox(height: 16.0,),
         Text("No Items Found",style: Styles.text30,)
        ],
      ),
    );
  }
}
