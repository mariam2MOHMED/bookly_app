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
class AddSavedBookLoading extends FetchSimiliarBooksState {}
class AddSavedBookSucess extends FetchSimiliarBooksState {


}
class AddSavedBookFailure extends FetchSimiliarBooksState {
 final String errorMessage;

 AddSavedBookFailure({required this.errorMessage});
}
class GetSavedBookLoading extends FetchSimiliarBooksState {}
class GetSavedBookSucess extends FetchSimiliarBooksState {
 final  List<dynamic> isSaved;

 GetSavedBookSucess({required this.isSaved});
}
class GetSavedBookFailure extends FetchSimiliarBooksState {
 final String errorMessage;

 GetSavedBookFailure({required this.errorMessage});
}
class DeleteBookLoading extends FetchSimiliarBooksState {}
class DeleteBookSucess extends FetchSimiliarBooksState {

}
class DeleteBookBookFailure extends FetchSimiliarBooksState {
 final String errorMessage;

 DeleteBookBookFailure({required this.errorMessage});
}

