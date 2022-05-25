import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vimnws/Helper/Dimension.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Helper/CustomText.dart';

class NewsDetails extends StatelessWidget {
  final String urltoImage;
  final String description;
  final String headline;

  const NewsDetails(
      {Key? key,
      required this.urltoImage,
      required this.description,
      required this.headline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(description);
    WebView.platform = SurfaceAndroidWebView();
    return  MaterialApp(
      title: 'VimNews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 300,
              backgroundColor: Colors.blueGrey,
              title: Row(children: [GestureDetector(onTap: (){
                Get.back();
              },
                child: Container(
                    child: Icon(Icons.arrow_back_ios_new),height: 40,width: 40,decoration: BoxDecoration(color: Colors.blue.withOpacity(0.5),borderRadius: BorderRadius.circular(40)),),
              ),],),
              automaticallyImplyLeading: false,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20,right: 20,top: 5),
                    child: Text(
                    headline,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimension.width10!*2.5),
                    maxLines: 2,
                ),
                  ),


                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.blueGrey.shade200),
                  height: 70,
                  width: double.maxFinite,
                ),
              ),
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(urltoImage,
                  fit: BoxFit.fill,
                ),
              ),

            ),
            SliverToBoxAdapter(
              child:Container(height: Dimension.Screenheight!/1.96,
                margin: EdgeInsets.all(6),decoration: BoxDecoration(boxShadow: [BoxShadow(offset: Offset(0,3),blurRadius: 6,spreadRadius: 6,color: Colors.blueGrey.shade200),],
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20)),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(margin: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2,
                            wordSpacing: 3,
                            fontSize: Dimension.width10! * 2.5),maxLines: 3,
                      ),
                    ),
                  ),
        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: [
      Icon(
      Icons.favorite_border_outlined,
      color: Colors.red,
      ),
      Icon(
          Icons.share,
          color: Colors.green,
      ),
      Icon(
          Icons.bookmark_add_outlined,
          color: Colors.deepPurple,
      ),
      ],
    ),
        )


                ],)
              ),
            )
          ],
        ),
      ),
    ) ;
  }
}
// Scaffold(
// appBar: AppBar(
// backgroundColor: Colors.white,
// elevation: 0,
// toolbarHeight: Dimension.width10! * 4,
// iconTheme: IconThemeData(color: Colors.black),
// title: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Vim",
// style: TextStyle(
// color: Colors.black, fontSize: Dimension.width10! * 3),
// ),
// Text(
// "News     ",
// style: TextStyle(
// color: Colors.blue,
// fontSize: Dimension.width10! * 3,
// ),
// )
// ],
// ),
// ),
// body: Stack(
// children: [
// Positioned(
// top: 10,
// left: 5,
// right: 5,
// child: Container(
// height: Dimension.Screenheight! / 2.3,
// width: Dimension.ScreenWidth! / 0.8,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.blueGrey,
// image: DecorationImage(
// fit: BoxFit.fill,
// image: NetworkImage(urltoImage),
// ),
// )),
// ),
// Positioned(
// top: Dimension.Screenheight! / 2.7,
// bottom: 0,
// left: 0,
// right: 0,
// child: Container(
// height: Dimension.Screenheight! / 1.5,
// width: Dimension.ScreenWidth,
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// offset: Offset(1, 0),
// blurRadius: 6,
// spreadRadius: 6,
// color: Colors.grey.shade100)
// ],
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(50),
// topRight: Radius.circular(50)),
// color: Colors.grey.shade100),
// child: SingleChildScrollView(
// child: Column(
// children: [
// Padding(
// padding:
// EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 10),
// child: Text(
// headline,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: Dimension.width10! * 3),
// maxLines: 3,
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
// child: Text(
// description,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// color: Colors.blueGrey,
// fontWeight: FontWeight.w300,
// letterSpacing: 1,
// wordSpacing: 2,
// fontSize: Dimension.width10! * 2.5),
// ),
// )
// ,Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceEvenly,
// children: [
// Icon(
// Icons.favorite_border_outlined,
// color: Colors.red,
// ),
// Icon(
// Icons.share,
// color: Colors.green,
// ),
// Icon(
// Icons.bookmark_add_outlined,
// color: Colors.deepPurple,
// ),
// ],
// )
// ],
// ),
// ),
// ),
// )
// ],
// ),
// )