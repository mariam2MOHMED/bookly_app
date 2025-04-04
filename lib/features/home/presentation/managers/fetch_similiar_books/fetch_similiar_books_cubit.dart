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

}
