import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:booklyapp/core/utils/errors/firebase_errors.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
//volumes?Filtering=free-ebooks&Sorting=newest &q=computer science
class HomeRepoImpl implements HomeRepo{
  final ApiServices apiServices;
  final UserModel? userModel;
  HomeRepoImpl(this.apiServices, this.userModel);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    // TODO: implement fetchBestSellerBooks
   var data=await apiServices.get(endPoint:
   "volumes?Filtering=free-ebooks&Sorting=newest &q=computer science");
 try{
   List<BookModel>books=[];
   for(var item in data["items"]){
     books.add(BookModel.fromJson(item));
   }
   return Right(books);
 }catch(e){
   if(e is DioException){
     return Left(ServerFailure.fromDioError(e));
   }
   return Left(ServerFailure(e.toString()));
 }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
   var data=await apiServices.get(endPoint:
   "volumes?Filtering=free-ebooks&q=subject:Programming");
  try{
    List<BookModel>featuedBooks=[];
    for(var item in data['items']){
      featuedBooks.add(BookModel.fromJson(item));

    }
    return Right(featuedBooks);
  }catch(e){
    if(e is DioException){
      return Left(ServerFailure.fromDioError(e));
    }
    return Left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks
      ({required String category})async {
    // TODO: implement fetchSimilarBooks
    var data=await apiServices.get(endPoint:
    'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');
    try{
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  BookModel? bookModel;
  List<dynamic>savedbooks=[];
  @override
  Future<Either<ErrorFirebase, BookModel>>
  addBookToSavedBooks(bookModel)async {
    // TODO: implement addBookToSavedBooks
    try {
      var data = await getBooksCollection(userModel!.id);
      DocumentReference<BookModel> doc = data.doc();
      bookModel.id = doc.id;
      await doc.set(bookModel); // تأكد إنها await

      savedbooks.add(bookModel);
    return right(bookModel);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ErrorFirebase.fromFirebase(e));
      } else {
        return left(ErrorFirebase(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<ErrorFirebase, List<BookModel>>> fetchSavedBooks() async {
    try {
      if (userModel?.id == null) {
        print('Error: userModel.id is null');
        return left(ErrorFirebase(errorMessage: 'User ID is null'));
      }
      final bookscoll = getBooksCollection(userModel!.id);
      QuerySnapshot<BookModel> books = await bookscoll.get();
      print('Fetched ${books.docs.length} books from Firestore');
      final saves = books.docs.map((e) => e.data()).toList();
      print('Mapped books: $saves');
      savedbooks = saves;
      //savedbooks=userModel!.isSaved!;
      return right(saves);
    } catch (e) {
      print('Error in fetchSavedBooks: $e');
      if (e is FirebaseAuthException) {
        return left(ErrorFirebase.fromFirebase(e));
      } else {
        return left(ErrorFirebase(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<ErrorFirebase, void>> deleteBookFromSaved(BookModel book)async {
  try{
    final bookscoll = getBooksCollection(userModel!.id);
    var delete=await bookscoll.doc(book!.id).delete();

     return right(delete);
  }catch(e){
    if (e is FirebaseAuthException) {
      return left(ErrorFirebase.fromFirebase(e));
    } else {
      return left(ErrorFirebase(errorMessage: e.toString()));
    }
  }
  }
}