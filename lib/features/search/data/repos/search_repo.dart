import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>>getSearch(String query);
}