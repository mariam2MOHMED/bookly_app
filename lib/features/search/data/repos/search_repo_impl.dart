import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl extends SearchRepo{
  final ApiServices apiServices;

  SearchRepoImpl( this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> getSearch(String query) async{
    var data=await apiServices.get(endPoint: "volumes?q=$query");
    try{
      List<BookModel>searchs=[];
      for(var item in data["items"]){
searchs.add(BookModel.fromJson(item));
      }
     return right(searchs);
    }catch(e){
      
      return Left(ServerFailure(e.toString()));
    }

  }
}