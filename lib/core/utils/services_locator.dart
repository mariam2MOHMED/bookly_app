import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/features/auth/data/repos/auth_repo_impl.dart';
import 'package:booklyapp/features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:booklyapp/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/models/user_model.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  // Register ApiServices
  getit.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));

  // Register SearchRepoImpl
  getit.registerLazySingleton<SearchRepoImpl>(() => SearchRepoImpl(getit.get<ApiServices>()));

  // Register AuthRepoImpl
  getit.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl());

  // Register UserModel
  getit.registerFactory<UserModel>(() {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      print('No authenticated user found, returning empty UserModel');
      return UserModel(id: firebaseUser!.uid!);
    }
    return UserModel(id: firebaseUser.uid);
  });

  // Register HomeRepoImpl
  getit.registerLazySingleton<HomeRepoImpl>(
        () => HomeRepoImpl(getit.get<ApiServices>(), getit.get<UserModel>()),
  );

  // Register other repositories as needed
  // getit.registerLazySingleton<BookMarkRepoImpl>(() => BookMarkRepoImpl());
}
// void setupServiceLocator() {
//   // Register UserModel
//   getit.registerLazySingleton<UserModel>(() {
//     final firebaseUser = FirebaseAuth.instance.currentUser;
//     if (firebaseUser == null) {
//       throw Exception('No authenticated user found');
//     }
//     return UserModel(id: firebaseUser.uid);
//   });
//
//   // Register HomeRepoImpl
//   // Register UserModel
//   getit.registerLazySingleton<UserModel>(() {
//     final firebaseUser = FirebaseAuth.instance.currentUser;
//     if (firebaseUser == null) {
//       throw Exception('No authenticated user found');
//     }
//     return UserModel(id: firebaseUser.uid);
//   });
//
//   // Register HomeRepoImpl with both dependencies
//   getit.registerLazySingleton<HomeRepoImpl>(
//         () => HomeRepoImpl(getit.get<ApiServices>(), getit.get<UserModel>()),
//   );
//
// }