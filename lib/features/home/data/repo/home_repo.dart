import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:booklyapp/core/utils/errors/firebase_errors.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<BookModel>>>fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimilarBooks({required String category});
  Future<Either<ErrorFirebase,BookModel>>addBookToSavedBooks(BookModel bookModel);
  Future<Either<ErrorFirebase,List<BookModel>>>fetchSavedBooks();
  Future<Either<ErrorFirebase,void>>deleteBookFromSaved(BookModel bookModel);
}