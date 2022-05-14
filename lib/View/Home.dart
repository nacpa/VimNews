import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:vimnws/View/NewsDetails.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _firedata=FirebaseFirestore.instance;
  bool liked = true;

  List<CategoryModel> Category = <CategoryModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Category = getCategory();
  }

  bool _loading = false;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    liked = false;
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
                    color: Colors.black, fontSize: Dimension.width10! * 3),
              ),
              Text(
                "News  ",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: Dimension.width10! * 3,
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: Dimension.width10! * 7,
                width: Dimension.width10! * 25,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Colors.grey.shade300)
                    ],
                    borderRadius: BorderRadius.circular(Dimension.width10! * 2),
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
              GetBuilder<NewsHeadlineController>(builder: (newsHeadline) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsHeadline.NewsHeadline.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(Dimension.width10! * 2),
                          height: Dimension.width10!*35,
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
                              ]),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: Dimension.width10! * 20,
                                width: Dimension.ScreenWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimension.width10! * 2),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(newsHeadline
                                            .NewsHeadline[i].urlToImage))),
                              ),
                              GestureDetector(onTap: ()=> Get.to(NewsDetails(urltoImage: newsHeadline.NewsHeadline[i].urlToImage, description: newsHeadline.NewsHeadline[i].content, headline: newsHeadline.NewsHeadline[i].description,))
                              ,
                                child: Padding(
                                  padding: EdgeInsets.all(Dimension.width10! * 1),
                                  child: Text(
                                    newsHeadline.NewsHeadline[i].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: Dimension.width10! * 2),
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    newsHeadline.NewsHeadline[i].source.name,
                                    style: TextStyle(
                                        fontSize: Dimension.width10! * 1.3),
                                  ),
                                  liked
                                      ? Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.green,
                                  ),
                                  GestureDetector(onTap: (){
                                    Map<String,String> Data={
                                      'name':"Nachiketa",'class':"First"
                                    };
                                    _firedata.collection("data").add(Data);
                                  }
                                      
                        ,
                                    child: Icon(
                        
                                      Icons.bookmark_add_outlined,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                );
              }),
            ],
          ),
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
