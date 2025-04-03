import 'package:booklyapp/features/home/presentation/view/widget/custom_home_view_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: CustomViewBody(),
    );
  }
}
