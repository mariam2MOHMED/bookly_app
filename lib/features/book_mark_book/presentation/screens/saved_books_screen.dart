import 'package:booklyapp/features/book_mark_book/presentation/widgets/saved_books_view_body.dart';
import 'package:flutter/material.dart';

class SavedBooksScreen extends StatelessWidget {
  const SavedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SavedBooksViewBody(),
    );
  }
}
