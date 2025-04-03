import 'package:booklyapp/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimiliarBookList extends StatelessWidget {
  const SimiliarBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: MediaQuery.of(context).size.height * .17,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return CustomBooKItem();
            },  itemCount: 10),
      );
  }
}
