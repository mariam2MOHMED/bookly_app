import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
 final SearchRepo searchRepo;
  List<BookModel>searchs=[];
  Future<void>getSearch(String query)async {
    emit(SearchLoading());
var result=await searchRepo.getSearch(query);
result.fold((failure) {
 emit(SearchFailure(error: failure.error));
}, (books) {
  searchs.addAll(books);
  emit(SearchSucess(books: books));
});
  }
}
