import 'package:booklyapp/core/utils/constants.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/core/utils/services_locator.dart';
import 'package:booklyapp/features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_newest_books/fetch_newest_cubit.dart';
import 'package:booklyapp/features/splash/presentation/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUp();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>FetchFeaturedBooksCubit
          (getit.get<HomeRepoImpl>()..fetchFeaturedBooks())),
        BlocProvider(create: (context)=>FetchNewestCubit
          (getit.get<HomeRepoImpl>()..fetchNewestBooks())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
          GoogleFonts.montserratTextTheme(ThemeData
              .dark()
              .textTheme),
        ),
      ),
    );
  }
}

