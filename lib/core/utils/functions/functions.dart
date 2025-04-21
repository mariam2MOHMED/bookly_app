
import 'package:booklyapp/core/utils/services_locator.dart';
import 'package:booklyapp/features/auth/presentation/screens/forget_password.dart';
import 'package:booklyapp/features/auth/presentation/screens/login_screen.dart';
import 'package:booklyapp/features/auth/presentation/screens/register_screen.dart';
import 'package:booklyapp/features/book_mark_book/presentation/screens/saved_books_screen.dart';
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
  static const kregisterView = '/RegisterView';
  static const kloginView = '/LoginView';
  static const kSavedBooksView = '/SavedBooksView';
  //ForgetPassword
  static const kforgetPassordView = '/ForgetPassword';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kSavedBooksView,
        builder: (context, state) => const SavedBooksScreen(),
      ),
      GoRoute(
        path:kforgetPassordView,
        builder: (context, state) =>  ForgetPassword(),
      ),
      GoRoute(
        path: kregisterView,
        builder: (context, state) =>  RegisterScreen(),
      ),
      GoRoute(
        path: kloginView,
        builder: (context, state) =>  LoginScreen(),
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