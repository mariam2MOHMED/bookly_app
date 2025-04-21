import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/features/home/presentation/view/screens/home_screen.dart';
import 'package:booklyapp/features/splash/presentation/view/widgets/sliding_txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset>slidingAnimation;
  @override
  void initState() {
    // TODO: implement initState

    animationController=
        AnimationController(vsync: this,duration: Duration(
      seconds: 5
    ));
    slidingAnimation=Tween<Offset>(
      begin: const Offset(0, 10),
        end: Offset(0,0)
    ).animate(animationController);
  animationController.forward();
    navigateToHome();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 8.0,),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
 void navigateToHome(){
   Future.delayed(
     const Duration(seconds: 2),
         () {


       GoRouter.of(context).push(AppRouter.kregisterView);
     },
   );
 }
}
