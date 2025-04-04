import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indictor.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookList extends StatefulWidget {
  const CustomBookList({super.key});

  @override
  State<CustomBookList> createState() => _CustomBookListState();
}

class _CustomBookListState extends State<CustomBookList> {
  void initState() {
    super.initState();
    context.read<FetchFeaturedBooksCubit>().fetchFeaturedtBooks();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
        builder: (context, state) {
          if(state is FetchFeaturedBooksSucess){
            return SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .3,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomBooKItem(
                      image: state.books[index].volumeInfo!
                          .imageLinks!.thumbnail!,
                    );
                  },

                  itemCount: state.books.length),
            );
          }
          else if(state is FetchFeaturedBooksFailure){
return CustomErrorWidget(error: state.errorMessage);
          }
else {
  return customLoadingIndictor();
          }
        },
      );
  }
}
