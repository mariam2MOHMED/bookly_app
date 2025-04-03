import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
    final Animation<Offset> slidingAnimation;
   SlidingText({required this.slidingAnimation});

  @override
  Widget build(BuildContext context) {
    return      AnimatedBuilder(
      builder: (context,_) {
        return SlideTransition(position: slidingAnimation,
            child: Text(" Read Free Books",textAlign:
            TextAlign.center,));
      }, animation: slidingAnimation,
    );
  }
}
