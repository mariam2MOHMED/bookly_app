import 'package:booklyapp/features/home/presentation/view/widget/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),

        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
      return Padding(

        padding:  EdgeInsets.symmetric(vertical: 10),
        child: BestSellerItem(),
      );
    },itemCount: 10,);
  }
}
