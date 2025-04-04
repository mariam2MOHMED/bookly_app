part of 'fetch_similiar_books_cubit.dart';


abstract class FetchSimiliarBooksState {}

 class FetchSimiliarBooksInitial extends FetchSimiliarBooksState {}
class FetchSimiliarBooksLoading extends FetchSimiliarBooksState {}
class FetchSimiliarBooksSucess extends FetchSimiliarBooksState {
 final List<BookModel>books;

  FetchSimiliarBooksSucess({required this.books});
}
class FetchSimiliarBooksFailure extends FetchSimiliarBooksState {
 final String errorMessage;

  FetchSimiliarBooksFailure({required this.errorMessage});
}
