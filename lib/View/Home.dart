import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vimnws/Helper/Dimension.dart';
import 'package:vimnws/Helper/data.dart';
import 'package:vimnws/Models/CategoryModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> Category = <CategoryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Category = getCategory();
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
      body: Container(
          child: Container(
        child: PageView.builder(
            controller: pageController,
            itemCount: Category.length,
            itemBuilder: (context, i) {
              return ContainerView(
                  imageurl: Category[i].imageurl,
                  Category: Category[i].CategoryName);
            }),
      )),
    );
  }
}

class ContainerView extends StatelessWidget {
  ContainerView({Key? key, required this.imageurl, required this.Category})
      : super(key: key);

  String imageurl;
  String Category;

  @override
  Widget build(BuildContext context) {
    return Container(height: 30,width: 50,
      child: Container(
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
        image: NetworkImage(imageurl),),),child: Text(Category,style: TextStyle(color: Colors.white),),

      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
