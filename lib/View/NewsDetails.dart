import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: Dimension.width10! * 4,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vim",
              style: TextStyle(
                  color: Colors.black, fontSize: Dimension.width10! * 3),
            ),
            Text(
              "News     ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: Dimension.width10! * 3,
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 5,
            right: 5,
            child: Container(
                height: Dimension.Screenheight! / 2.3,
                width: Dimension.ScreenWidth! / 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(urltoImage),
                  ),
                )),
          ),
          Positioned(
            top: Dimension.Screenheight! / 2.7,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Dimension.Screenheight! / 1.5,
              width: Dimension.ScreenWidth,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 0),
                        blurRadius: 6,
                        spreadRadius: 6,
                        color: Colors.grey.shade100)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.grey.shade100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text(
                        headline,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimension.width10! * 3),
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                      child: Text(
                        description,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            fontSize: Dimension.width10! * 2.5),
                      ),
                    ),Row(
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
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
