import 'package:flutter/material.dart';
import 'package:news/helper/blogdata.dart';
import 'package:news/models/blog_model.dart';
import 'package:news/views/article.dart';
class Categories extends StatefulWidget {
  final String category;

  Categories({this.category});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
 List<BlogModel> articles = new List<BlogModel>();  
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }
    getCategoryNews() async{
    CategoryNews newsClass = CategoryNews();
      await newsClass.getCategoryNews(widget.category);
      articles = newsClass.news;
      setState(() {
        _loading = false;
      });
     }
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
          body:  _loading ?Center(
          child: Container(
            child: CircularProgressIndicator(),
          ))
        :SingleChildScrollView(
            child: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.red])),
            child: Column(
              children: <Widget>[
                   Container(
                    padding: EdgeInsets.fromLTRB(10,0,10,0),
                   child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context,index){
                       return BlogTile(imageUrl: articles[index].urlToImage, title: articles[index].title, desc: articles[index].description,url:articles[index].url);

                      })
                 
                 ),
              ]
            ),
      ),
        ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String url,imageUrl,title,desc;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Article(
           blogUrl: url,
          ),

          ));
        },
          child: Container(
        child: Column(
          children: <Widget>[
                    ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(imageUrl)),
            Text(title,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,color: Colors.black),),
            Text(desc,style: TextStyle(color: Colors.white70,fontSize: 14,)),
            SizedBox(height:15,)
          ]
        ),
      ),
    );
  }
}