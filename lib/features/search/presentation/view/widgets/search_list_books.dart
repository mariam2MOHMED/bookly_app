import 'package:booklyapp/core/widgets/custom_loading_indictor.dart';
import 'package:booklyapp/features/home/presentation/view/widget/best_seller_item.dart';
import 'package:booklyapp/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListBooks extends StatelessWidget {
  const SearchListBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
     if(state is SearchSucess){
       return ListView.builder(

         padding: EdgeInsets.zero,
         itemBuilder: (context, index) {
           return Padding(

             padding: EdgeInsets.symmetric(vertical: 10),
             child: BestSellerItem(bookModel:state.books[index],),
           );
         }, itemCount: state.books.length,);
     }else {
       return customLoadingIndictor();
     }
      },
    );
  }
}
