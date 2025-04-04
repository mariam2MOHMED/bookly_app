
import 'package:booklyapp/core/utils/services_locator.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_similiar_books/fetch_similiar_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/view/screens/home_screen.dart';
import 'package:booklyapp/features/splash/presentation/view/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/book_detials/presentation/view/screens/book_detials.dart';
import '../../../features/search/presentation/view/screens/search_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen()),
      GoRoute(
          path: kSearchView,
          builder: (context, state) => const SearchScreen()),
GoRoute(path: kBookDetailsView,

builder: (context,state)=>BlocProvider
  (create: ( context) =>FetchSimiliarBooksCubit(getit.
get<HomeRepoImpl>()),
child:  BookDetialsScreen(
  bookModel: state.extra as BookModel,
)))

    ],
  );
}