import 'package:booklyapp/features/search/presentation/view/widgets/no_search_items.dart';
import 'package:booklyapp/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:booklyapp/features/search/presentation/view/widgets/custom_search_field.dart';
import 'package:booklyapp/features/search/presentation/view/widgets/search_list_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return CustomSearchField(
                  onChanged: (query) {
                    context.read<SearchCubit>().getSearch(query);
                  },
                );
              },
            ),
            SizedBox(height: 16.0,),

              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {

                  return BlocProvider.of<SearchCubit>(context).searchs.isEmpty?
                noSearchItems():  Expanded(child: SearchListBooks());
                },
              )


          ],
        ),
      );
  }
}
