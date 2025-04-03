import 'package:booklyapp/features/home/presentation/view/widget/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchListBooks extends StatelessWidget {
  const SearchListBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      padding: EdgeInsets.zero,
      itemBuilder: (context,index){
        return Padding(

          padding:  EdgeInsets.symmetric(vertical: 10),
          child: BestSellerItem(),
        );
      },itemCount: 10,);
  }
}
