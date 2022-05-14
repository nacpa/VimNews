import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vimnws/Controller/NewsHeadlineController.dart';
import 'package:vimnws/View/Authentication/Sign_in_Page.dart';
import 'package:vimnws/View/Home.dart';

import '../Helper/Dimension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation2;
  late AnimationController animationController;
  void _LoadResourse()async{
   await Get.find<NewsHeadlineController>().NewsHeadline;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =AnimationController(duration: const Duration(seconds:3), vsync:this)..forward();
    animation=CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubicEmphasized);
    animation2=CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    _LoadResourse();
    Timer(Duration(seconds: 4), ()=>
    Get.to(SignInPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
              child: Image.asset("assets/image/logo part 1.jpg",width: Dimension.ScreenWidth,)),
          ScaleTransition(scale: animation2,
              child: Text("Vim News",style: TextStyle(fontSize: 40,letterSpacing: 2,color: Colors.blueGrey),)),

        ],),),
    );
  }
}
