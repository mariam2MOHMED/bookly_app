import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
//volumes?Filtering=free-ebooks&Sorting=newest &q=computer science
class HomeRepoImpl implements HomeRepo{
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    // TODO: implement fetchBestSellerBooks
   var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=newest &q=computer science");
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
    var data=await apiServices.get(endPoint:  'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
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
}