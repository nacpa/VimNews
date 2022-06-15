import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:vimnws/View/Authentication/Sign_in_Page.dart';
import 'package:vimnws/View/BookMark.dart';
import 'package:vimnws/View/NewsDetails.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firedata = FirebaseFirestore.instance;
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
    PageController pageController = PageController(viewportFraction: 0.6);
    bool Saved = false;

    return Scaffold(backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => Get.to(bookMark()),
                    child: Icon(Icons.bookmark_add_outlined)),
                Text(
                  "Vim",
                  style: TextStyle(
                      color: Colors.black, fontSize: Dimension.width10! * 3),
                ),
                Text(
                  "News         ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: Dimension.width10! * 3,
                  ),
                )
              ],
            ),GestureDetector(onTap: (){
              FirebaseAuth.instance.signOut().then((value) => Get.to(SignInPage()));

              },
                  child: Icon(Icons.logout,color: Colors.black,))],),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: Dimension.width10! * 7,
                width: double.maxFinite,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(Dimension.width10! * 2),
                    color: Colors.white),
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
                          height: Dimension.width10! * 35,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    color: Colors.grey.shade300),
                                BoxShadow(
                                    offset: Offset(-4, -4),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    color: Colors.white38),
                              ]),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(NewsDetails(
                                  urltoImage:
                                      newsHeadline.NewsHeadline[i].urlToImage,
                                  description:
                                      newsHeadline.NewsHeadline[i].description,
                                  headline: newsHeadline.NewsHeadline[i].title,
                                )),
                                child: Container(
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
                              ),
                              GestureDetector(
                                onTap: () => Get.to(NewsDetails(
                                  urltoImage:
                                      newsHeadline.NewsHeadline[i].urlToImage!,
                                  description:
                                      newsHeadline.NewsHeadline[i].content!,
                                  headline:
                                      newsHeadline.NewsHeadline[i].description!,
                                )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(Dimension.width10! * 1),
                                  child: Text(
                                    newsHeadline.NewsHeadline[i].title
                                        .toString(),
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
                                    newsHeadline.NewsHeadline[i]!.source.name,
                                    style: TextStyle(
                                        fontSize: Dimension.width10! * 1.3),
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.green,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Map<String, String> Data = {
                                          'urlToImage': newsHeadline
                                              .NewsHeadline[i].urlToImage,
                                          'title':
                                              newsHeadline.NewsHeadline[i].title
                                        };

                                        _firedata.collection("data").add(Data);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        primary: Colors.deepOrange,
                                      ),
                                      child: Icon(Icons.bookmark_add_outlined))
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
    return Stack(
      children: [
        Container(
          height: 130,
          width: 220,
          margin: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-4, 4),
                    blurRadius: 6,
                    spreadRadius: 3,
                    color: Colors.grey.shade400),
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageurl),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        ClipRRect(
          child: BackdropFilter(filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),child:  Align(
            alignment: Alignment.center,
            child: Text(
              Category,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),),
        ),

      ],
    );
  }
}
