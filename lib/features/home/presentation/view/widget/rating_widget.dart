import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class RatingWidget extends StatelessWidget {
   RatingWidget({this.mainAxisAlignment=
       MainAxisAlignment.start});
final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar,size: 14,
          color: Color(0xffefc61a),),
    const    SizedBox(width: 6.3,),
        Text("4.8",style: Styles.text16.copyWith(
          color: Colors.white
        ),),
        const    SizedBox(width: 5.0,),
        Text("( 234 )",style: Styles.text14.copyWith(
          color: Color(0xff707070)
        ),),
      ],
    );
  }
}
