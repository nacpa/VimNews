import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'dart:ffi';
class BigText extends StatelessWidget {
  final Color TextColor;
  final String text;
  final double size ;
  // TextOverflow overflow;

   BigText({Key? key, required this.TextColor, required this.text, required this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return Text(text,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,color: TextColor, fontSize: size));

  }
}

class SmalText extends StatelessWidget {
  final Color TextColor;
  final String text;
  final double size ;
  TextOverflow overflow;

   SmalText({Key? key, required this.TextColor, required this.text, required this.size, this.overflow=TextOverflow.ellipsis}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return Text(text,overflow: overflow,style: TextStyle(fontWeight: FontWeight.w500,color: TextColor, fontSize: size));

  }
}


