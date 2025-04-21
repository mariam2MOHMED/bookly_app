import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_newest_state.dart';

class FetchNewestCubit extends Cubit<FetchNewestState> {
  FetchNewestCubit(this.homeRepo) : super(FetchNewestInitial());
 final HomeRepo homeRepo;
 Future<void>fetchNewestBooks()async{
   var result=await homeRepo.fetchNewestBooks();
   emit(FetchNewestLoading());
   result.fold((failure) {
     emit(FetchNewestFailure(errorMessage: failure.error));
   }, (books) {
     emit(FetchNewestSucess(books: books));
   });
 }
}
