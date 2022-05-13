import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vimnws/Controller/NewsHeadlineController.dart';
import 'package:vimnws/Helper/Dependies.dart';
import 'package:vimnws/Helper/Dimension.dart';
import 'package:vimnws/Helper/data.dart';
import 'package:vimnws/Models/ArticleModel.dart';
import 'package:vimnws/Models/CategoryModel.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool liked=false;



  List<CategoryModel> Category = <CategoryModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Category=getCategory();}

  bool _loading=true;
@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    liked=false;
  }




  @override
  Widget build(BuildContext context) {


    PageController pageController = PageController(viewportFraction: 0.8);


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vim",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                "News",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100),
              child: PageView.builder(
                  controller: pageController,
                  itemCount: Category.length,
                  itemBuilder: (context, i) {
                    return ContainerView(
                        imageurl: Category[i].imageurl,
                        Category: Category[i].CategoryName);
                  }),
            ),
           GetBuilder<NewsHeadlineController>(builder:(newsHeadline) {
             return  Expanded(
               child: ListView.builder(
                   shrinkWrap: true,
                   itemCount: newsHeadline.NewsHeadline.length,
                   itemBuilder: (context, i) {
                     return Container(
                       margin: EdgeInsets.all(20),
                       height: 350,
                       width: double.maxFinite,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(30),
                           boxShadow: [
                             BoxShadow(
                                 offset: Offset(0, 4),
                                 blurRadius: 3,
                                 spreadRadius: 3,
                                 color: Colors.grey.shade300)
                           ]),child: Column(children: [Container(margin: EdgeInsets.all(5),
                       height: 200,width: Dimension.ScreenWidth,
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                           image: DecorationImage(fit: BoxFit.fill,image: NetworkImage(newsHeadline.NewsHeadline[i].urlToImage))),),
                             Padding(
                             padding:  EdgeInsets.all(10.0),
                             child:
                             Text(
                               newsHeadline.NewsHeadline[i].title,overflow: TextOverflow.ellipsis,
                               style: TextStyle(fontSize: 20),maxLines: 3,),),
                             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [Text(newsHeadline.NewsHeadline[i].source.name,style: TextStyle(fontSize: 13),),
                               GestureDetector(onTap: (){
                                 liked ? liked=false:liked=true;
                               } ,
                                   child: liked? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border_outlined,color: Colors.red,)
                               ),
                               Icon(Icons.share,color: Colors.green,),
                               Icon(Icons.bookmark_add_outlined,color: Colors.deepPurple,),
                             ],)


                     ],),
                     );
                   }),
             );
           }),
          ],
        ));
  }
}

class ContainerView extends StatelessWidget {
  ContainerView({Key? key, required this.imageurl, required this.Category})
      : super(key: key);

  String imageurl;
  String Category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 4),
                blurRadius: 0,
                spreadRadius: 0,
                color: Colors.grey.shade400)
          ],
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageurl),
          ),
        ),
        child: Center(
            child: Text(
          Category,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        )),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
