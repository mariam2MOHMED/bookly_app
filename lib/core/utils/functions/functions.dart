
import 'package:booklyapp/features/home/presentation/view/screens/home_screen.dart';
import 'package:booklyapp/features/splash/presentation/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../features/book_detials/presentation/view/screens/book_detials.dart';

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

GoRoute(path: kBookDetailsView,

builder: (context,state)=>const BookDetialsScreen())

    ],
  );
}