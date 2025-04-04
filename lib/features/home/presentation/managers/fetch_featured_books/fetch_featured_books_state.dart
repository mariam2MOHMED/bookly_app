part of 'fetch_featured_books_cubit.dart';

abstract class FetchFeaturedBooksState {}


 class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}
class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}
class FetchFeaturedBooksSucess extends FetchFeaturedBooksState {
  List<BookModel>books;
  FetchFeaturedBooksSucess({required this.books});
}
class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errorMessage;

  FetchFeaturedBooksFailure({required this.errorMessage});
}