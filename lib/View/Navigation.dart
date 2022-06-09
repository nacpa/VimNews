import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vimnws/View/BookMark.dart';
import 'package:vimnws/View/Home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late int _selectedIndex=0;


  List Pages=[
    Home(),
    bookMark() ,
  ];

  void OnTap(int x){
    setState(() {
      _selectedIndex=x;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Pages[_selectedIndex],bottomNavigationBar: BottomNavigationBar(
      selectedItemColor:Colors.purple,unselectedItemColor: Colors.grey,onTap:OnTap ,currentIndex: _selectedIndex,showSelectedLabels: false,showUnselectedLabels: false,
      items:
      [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: 'home'),


      ],),);
  }
}
