import 'package:booklyapp/features/book_detials/presentation/view/widgets/book_detials_view_body.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_similiar_books/fetch_similiar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/book_model.dart';

class BookDetialsScreen extends StatefulWidget {
  BookModel bookModel;
   BookDetialsScreen({required this.bookModel});

  @override
  State<BookDetialsScreen> createState() => _BookDetialsScreenState();
}

class _BookDetialsScreenState extends State<BookDetialsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    context.read<FetchSimiliarBooksCubit>().fetchSimiliarBooks(widget.bookModel
        .volumeInfo?.categories?[0]??"Meteorology");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: BookDetialsViewBody(
        bookModel: widget.bookModel,
      ),
      ),
    );
  }
}


String getCategoryOrDefault(BookModel model,int index) {
  final categories = model.volumeInfo?.categories;
  if (categories != null && categories.isNotEmpty && categories.isNotEmpty) {
    return categories[index];
  }
  return "Meteorology";
}