import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vimnws/Helper/Dimension.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  bool _loading=true;
  final _fireData=FirebaseFirestore.instance;
  List<String> UrlToImiage=[];
  List<String> Title=[];
  late int Length=0;


  Future GetBookMark()async {
    final Data= await  _fireData.collection("data").get();
    Length=Data.size;
    Data.docs.forEach((element) {
      UrlToImiage.add(element['urlToImage'].toString());
      Title.add(element['title']);
      _loading=false;
      // print(element['title'].toString());
      // print(element['urlToImage'].toString());
      print(Length);
    });
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      GetBookMark();
      _loading=false;
    });

    print("NAcpa");


  }
  @override
  Widget build(BuildContext context) {
    GetBookMark();



    return Scaffold(appBar: AppBar(
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
    body: _loading?Container(child: CircularProgressIndicator(color: Colors.purple,),) :Container(height: double.maxFinite,width: double.maxFinite,
      margin: EdgeInsets.all(4),color: Colors.white,
      child: ListView.builder(itemCount:Length,shrinkWrap: true,
          itemBuilder: (context,i){ GetBookMark();
          return  Container(margin: EdgeInsets.only(bottom: Dimension.width10!*2,top: Dimension.width10!*2),
            height: Dimension.Screenheight!/9,width: Dimension.ScreenWidth!/0.9,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(offset: Offset(0,4),blurRadius: 3,spreadRadius: 3,color: Colors.grey.shade400)]),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height:double.maxFinite,width: Dimension.width10!*10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(fit: BoxFit.fill,
                          image: NetworkImage(UrlToImiage[i])),
                    )

                ),
                Container(height:double.maxFinite,width: Dimension.ScreenWidth!/1.6,margin: EdgeInsets.all(10),
                    child: Text(Title[i],overflow: TextOverflow.ellipsis,maxLines: 4,style: TextStyle(fontWeight: FontWeight.bold,fontSize: Dimension.width10!*2),)
                    ,decoration: BoxDecoration(
                    )

                ),
              ],),
          );
          }),
    ),);
  }
}
