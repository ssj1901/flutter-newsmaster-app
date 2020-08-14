import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/views/countries.dart';
import 'package:news/views/home.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  {
  int currentPage=0;
PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage:currentPage);
    super.initState();
    
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (pageIndex){
          setState(() {
            currentPage=pageIndex;
          });
        },
        children: <Widget>[
          Home(),
          Country(),
      ],),
         bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black54,
        currentIndex:currentPage,
        onTap:(pIndex){
        pageController.animateToPage(pIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.bounceInOut
         );
        },
        activeColor:Colors.white,
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.explore,)),
           ],
          ),
      
    );
  }
}