import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/view/widget/best_seller_item.dart';
import 'package:booklyapp/features/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:booklyapp/features/home/presentation/view/widget/custom_app.dart';
import 'package:booklyapp/features/home/presentation/view/widget/custom_book_list.dart';
import 'package:flutter/material.dart';

class CustomViewBody extends StatelessWidget {
  const CustomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
    SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 20.0,),
          CustomBookList(),
          SizedBox(height: 30.0,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Best Seller",style: Styles.text18,),
          ),
          SizedBox(height: 30.0,),
        ],
      ),
    ),
        SliverFillRemaining(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: BestSellerListView(),
          ),
        )
      ],
    );

//       Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomAppBar(),
//         SizedBox(height: 20.0,),
//         CustomBookList(),
//         SizedBox(height: 30.0,),
// Padding(
//   padding:  EdgeInsets.symmetric(horizontal: 20.0),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text("Best Seller",style: Styles.text18,),
//       SizedBox(height: 30.0,),
//       BestSellerItem(),
//
//     ],
//   ),
// )
//       ],
//     );
  }
}
