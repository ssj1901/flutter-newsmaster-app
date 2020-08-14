import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:news/models/blog_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<BlogModel> news = [];
  Future<void> getNews(String country) async{
  String url = "https://newsapi.org/v2/top-headlines?country=$country&apiKey=2747b97a414b47c2b895e0e50e7da6f1";
  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  if(jsonData['status'] == 'ok'){
    jsonData["articles"].forEach((element){
          if(element['urlToImage']!= null && element['description']!=null){
          BlogModel blogModel = BlogModel(
          title: element['title'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
          publishedAt: DateTime.parse(element['publishedAt']),   
         );
          news.add(blogModel);
          }
    });
  }
  }
  
}
class CategoryNews{
  List<BlogModel> news = [];
  Future<void> getCategoryNews(String category) async{
  String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=2747b97a414b47c2b895e0e50e7da6f1";
  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  if(jsonData['status'] == 'ok'){
    jsonData["articles"].forEach((element){
          if(element['urlToImage']!= null && element['description']!=null){
          BlogModel blogModel = BlogModel(
          title: element['title'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
          publishedAt: DateTime.parse(element['publishedAt']),   
         );
          news.add(blogModel);
          }
    });
  }
  }
  
}