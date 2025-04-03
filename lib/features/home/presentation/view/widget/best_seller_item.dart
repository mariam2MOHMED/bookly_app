import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/view/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: SizedBox(
        height: 135,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8/4,
                child: Image.asset(AssetsData.test,
                  fit: BoxFit.fill,),
              ),
            ),
            SizedBox(width: 30.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text("Harry Botter and Golbet of Fire",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.text20.copyWith(
                        fontWeight: FontWeight.bold,color: Colors.white
                      ),),
                  ),
                 const SizedBox(height: 3,),
                  Text("J.K Rowling",style: Styles.text14,),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text("19.99 \$",
                        style: Styles.text20.copyWith(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold,color: Colors.white
                      ),),
                      Spacer(),
                      RatingWidget()
                    ],
                  )

                ],
              ),
            )
          ],
        ),
            ),
      );
  }
}
