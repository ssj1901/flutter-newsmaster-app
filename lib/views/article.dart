import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Article extends StatefulWidget {
 
  final String blogUrl;
  Article({this.blogUrl});
 
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
 
 final Completer<WebViewController>_completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Text('The',style: TextStyle(color: Colors.white,fontSize:25,)),
              Text('News',style: TextStyle(color:Colors.blue,fontSize:25),),
              Text('Master',style: TextStyle(color: Colors.white,fontSize:25,))
            ]
          ),
        ),
          body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
        
      ),
    );
  }
}