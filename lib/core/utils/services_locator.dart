import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit=GetIt.instance;
void setUp(){
  getit.registerSingleton<ApiServices>(ApiServices(Dio()));
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiServices(Dio())));
}