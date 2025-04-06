part of 'search_cubit.dart';

abstract class SearchState {}

 class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSucess extends SearchState {
 final List<BookModel>books;

  SearchSucess({required this.books});
}
class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});
}


