import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/book_detials/presentation/view/widgets/custom_app_bar_book_detials.dart';
import 'package:booklyapp/features/book_detials/presentation/view/widgets/custom_txt_btn.dart';
import 'package:booklyapp/features/book_detials/presentation/view/widgets/similiar_list_view.dart';
import 'package:booklyapp/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:booklyapp/features/home/presentation/view/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetialsViewBody extends StatelessWidget {
   BookDetialsViewBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              CustomBookDetialsAppBar(),
              Padding(
                padding:  EdgeInsets.symmetric
                  (horizontal: MediaQuery.of(context).size.width*0.18),
                child: CustomBooKItem(),
              ),
              Text("The Jungle Book",style: Styles.text30,),
              SizedBox(height: 6.0,),
              Opacity(
                  opacity: 0.7,
                  child: Text("JK Rowling",style: Styles.text18.copyWith(
                      fontStyle: FontStyle.italic
                  ),)),
              SizedBox(height: 16.0,),
              RatingWidget(mainAxisAlignment: MainAxisAlignment.center,)
              , SizedBox(height: 16.0,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:
                MediaQuery.of(context).size.width*0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTxtBtn(txt: "19.99\$",
                          bg: Colors.white,
                          txtColor: Colors.black,
                          radius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              bottomLeft: Radius.circular(16.0)
                          ),
                          onPressed: (){

                          }),
                    ),
                    Expanded(
                      child: CustomTxtBtn(txt: "Free Preview",
                          bg: Color(0xffEF8262),
                          txtColor: Colors.white,
                          radius: BorderRadius.only(
                              topRight: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0)
                          ),
                          onPressed: (){

                          }),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox(
                height: 40.0,
              )),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("You Can also like this",style: Styles.text20.copyWith(
                    color: Colors.white
                ),),
              ),
              SizedBox(height: 16.0,),
              SimiliarBookList(),
            ],
          ),
        )
      ],
    );


  }
}
