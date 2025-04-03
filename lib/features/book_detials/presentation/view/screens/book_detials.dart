import 'package:booklyapp/features/book_detials/presentation/view/widgets/book_detials_view_body.dart';
import 'package:flutter/material.dart';

class BookDetialsScreen extends StatelessWidget {
  const BookDetialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: BookDetialsViewBody(),
      ),
    );
  }
}
