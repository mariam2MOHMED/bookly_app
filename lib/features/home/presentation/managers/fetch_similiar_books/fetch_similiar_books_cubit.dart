import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model.dart';

part 'fetch_similiar_books_state.dart';

class FetchSimiliarBooksCubit extends Cubit<FetchSimiliarBooksState> {
  FetchSimiliarBooksCubit(this.homeRepo) : super(FetchSimiliarBooksInitial());
  final HomeRepo homeRepo;
  Future<void>fetchSimiliarBooks(String category)async {
    var result = await homeRepo.fetchSimilarBooks(category: category);
    emit(FetchSimiliarBooksLoading());
    result.fold((failure) {
      emit(FetchSimiliarBooksFailure(errorMessage: failure.error));
    }, (books) {
      emit(FetchSimiliarBooksSucess(books: books));
    });
  }
  List<dynamic>savedbooks=[];
  Future<void>addBookToSavedBooks(BookModel bookModel)async {
    emit(AddSavedBookLoading());
    var result=await homeRepo.addBookToSavedBooks(bookModel);

    result.fold((l) {
      emit(AddSavedBookFailure(errorMessage: l.errorMessage));
    }, (r) {

      emit(AddSavedBookSucess());
    });
  }
  Future<void> getSavedBooks() async {
    emit(GetSavedBookLoading());
    var result = await homeRepo.fetchSavedBooks(); // تأكد إنها موجودة في الريبو
    result.fold((failure) {
      emit(GetSavedBookFailure(errorMessage: failure.errorMessage));
    }, (books) {
      savedbooks = books;
      emit(GetSavedBookSucess(isSaved: books));
    });
  }

  Future<void>deleteBook(BookModel bookModel )async{
    var result=await homeRepo.deleteBookFromSaved( bookModel);
    emit(DeleteBookLoading());
    result.fold((l) {
      emit(DeleteBookBookFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(DeleteBookSucess());
    });

  }
}
