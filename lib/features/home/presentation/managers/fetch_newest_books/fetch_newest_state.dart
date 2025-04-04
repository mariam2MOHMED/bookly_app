part of 'fetch_newest_cubit.dart';

abstract class FetchNewestState {

}

 class FetchNewestInitial extends FetchNewestState {}
class FetchNewestLoading extends FetchNewestState {}
class FetchNewestSucess extends FetchNewestState {
  List<BookModel>books;
  FetchNewestSucess({required this.books});
}
class FetchNewestFailure extends FetchNewestState {
  final String errorMessage;

  FetchNewestFailure({required this.errorMessage});
}