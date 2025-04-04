import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indictor.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_similiar_books/fetch_similiar_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimiliarBookList extends StatelessWidget {
  const SimiliarBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<FetchSimiliarBooksCubit, FetchSimiliarBooksState>(
        builder: (context, state) {
          if(state is FetchSimiliarBooksSucess){
            return SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .17,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomBooKItem(
                      image: state.books[index].volumeInfo!.imageLinks!
                          .thumbnail??"https://i.pinimg.com/736x/58/e3/32/58e332de21b6af4b1417d2c7c38be1ed.jpg",
                    );
                  }, itemCount: state.books.length),
            );
          }else if(state is FetchSimiliarBooksFailure){
            return CustomErrorWidget(error: state.errorMessage);
          }else{
            return customLoadingIndictor();
          }

        },
      );
  }
}
