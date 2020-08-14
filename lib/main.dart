import 'package:flutter/material.dart';
import 'package:news/navig.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:news/views/home.dart';
 void main() {
  runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),debugShowCheckedModeBanner: false,
      home: LoadingPage(),
   );
  }
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
     title: new Text(
        'Providing the Latest..',
        style: new TextStyle( 
            fontSize: 17.0,color: Colors.white),
      ),
      image: new Image.asset('assets/logo.png'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 130.0,
      loaderColor: Colors.red,
      seconds: 5,
      navigateAfterSeconds: MainPage(),
    );
    
  }
}