import 'package:booklyapp/core/utils/services_locator.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/view/widget/best_seller_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../home/presentation/managers/fetch_similiar_books/fetch_similiar_books_cubit.dart';

class SavedBooksViewBody extends StatelessWidget {
  const SavedBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchSimiliarBooksCubit(getit.get<HomeRepoImpl>())..getSavedBooks(),
      child: BlocConsumer<FetchSimiliarBooksCubit, FetchSimiliarBooksState>(
  listener: (context, state) {
      if (state is DeleteBookBookFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      }
  },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Saved Books", style: Styles.text30),
          SizedBox(height: 20.0),
          Expanded(
              child: context
                  .read<FetchSimiliarBooksCubit>()
                  .savedbooks
                  .isNotEmpty
                  ? ListView.separated(
                itemCount: context
                    .read<FetchSimiliarBooksCubit>()
                    .savedbooks
                    .length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane:ActionPane(motion: DrawerMotion(),
                        children: [
                          SlidableAction(onPressed: (c ){
                            context.read<FetchSimiliarBooksCubit>()
                                .deleteBook(
                                context.read<FetchSimiliarBooksCubit>().savedbooks[index]
                            );
                            context.read<FetchSimiliarBooksCubit>().
                            getSavedBooks();
                          },
                            icon: Icons.delete,
                            label: 'Delete',
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            spacing: 10.0,   borderRadius: BorderRadius.circular(16),
                          )
                        ]) ,
                    child:
                    BestSellerItem(
                        bookModel: context
                            .read<FetchSimiliarBooksCubit>()
                            .savedbooks[index]
                    ),
                  );

                }, separatorBuilder: ( context,  index) {
                return SizedBox(height: 20.0); },
              )
                  : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.book,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      "No SavedBooks Yet",
                      style: Styles.text30,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  },
),
    );
  }
}
