import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vimnws/Helper/Dimension.dart';



final _FireData = FirebaseFirestore.instance.collection("data");
class bookMark extends StatelessWidget {
  const bookMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: _FireData.orderBy("urlToImage",descending: true).snapshots(),builder: (context,snapshot){
      if (snapshot.data == null) {
        return Center(
          child: Scaffold(
            body: Container(
                height: Dim.Hight10*5.0,
                width: Dim.Hight10*5.0,
                color: Colors.white,
                child: Center(child: CircularProgressIndicator(color: Colors.orange,))),
          ),
        );
      };
      final BookMarkList=snapshot.data?.docs;
      List<Map<String,String>> BookMarks=[];
      if(true){
        BookMarkList?.forEach((element) { BookMarks.add({"Tittle":element["title"],"Url":element["urlToImage"]});});

      }
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
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          margin: EdgeInsets.all(4),
          color: Colors.white,
          child: ListView.builder(
              itemCount: BookMarks.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: Dimension.width10! * 2,
                      top: Dimension.width10! * 2),
                  height: Dimension.Screenheight! / 9,
                  width: Dimension.ScreenWidth! / 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.grey.shade400)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: double.maxFinite,
                          width: Dimension.width10! * 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(BookMarks[i]["Url"].toString())),
                          )),
                      Container(
                          height: double.maxFinite,
                          width: Dimension.ScreenWidth! / 1.6,
                          margin: EdgeInsets.all(10),
                          child: Text(
                            BookMarks[i]["Tittle"].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimension.width10! * 2),
                          ),
                          decoration: BoxDecoration()),
                    ],
                  ),
                );
              }),
        ),
      );
    },);
  }
}

