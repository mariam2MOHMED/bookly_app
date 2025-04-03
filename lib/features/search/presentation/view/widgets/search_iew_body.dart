import 'package:booklyapp/features/search/presentation/view/widgets/custom_search_field.dart';
import 'package:booklyapp/features/search/presentation/view/widgets/search_list_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
        children: [
          CustomSearchField(),
          SizedBox(height: 16.0,),
          Expanded(child: SearchListBooks())
        ],
            ),
      );
  }
}
