import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class customLoadingIndictor extends StatelessWidget {
  const customLoadingIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingAnimationWidget
        .inkDrop(color: Colors.white, size: 40));
  }
}
