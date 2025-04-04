import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.homeRepo) : super(FetchFeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void>fetchFeaturedtBooks()async{
    emit(FetchFeaturedBooksLoading());
    var result=await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FetchFeaturedBooksFailure(errorMessage: failure.error));
    }, (books) {
      emit(FetchFeaturedBooksSucess(books: books));
    });
  }
}
