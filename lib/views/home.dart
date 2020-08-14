import 'package:flutter/material.dart';
import 'package:news/helper/data.dart';
import 'package:news/models/blog_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/helper/blogdata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/views/article.dart';
import 'package:news/views/categories.dart';
class Home extends StatefulWidget {
  final String country;
  Home({this.country='in'});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  List<CategoryModel> categories = new List<CategoryModel>();
  List<BlogModel> articles = new List<BlogModel>();
  @override
    getNews() async{
    News newsClass = News();
      await newsClass.getNews(widget.country);
      articles = newsClass.news;
      setState(() {
        _loading = false;
      });
     }

  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getcategories();
     getNews();
  }
   

  @override
  Widget build(BuildContext context) {
    
 // var ctheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('The',style: TextStyle(color: Colors.white,fontSize:25,fontFamily: 'Trajan',)),
              Text('News',style: TextStyle(color:Colors.blue,fontSize:25,fontFamily: 'Trajan')),
              Text('Master',style: TextStyle(color: Colors.white,fontSize:25,fontFamily: 'Trajan')),
            ]
          ),
        ),
        body: _loading ?Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        )
         :SingleChildScrollView(
        child: Container(
          // height: ctheight*0.9,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.red])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
                    Container(
                       height: 200.0,
                            width: 500.0,
                            color: Colors.white,
                            child: Image(
                            image: AssetImage('assets/newstitle.png'),fit: BoxFit.fitHeight,),
                   ),
                   SizedBox(height: 10,),                
                   Container(
                    padding: EdgeInsets.only(left:10),
                     child: Text('Browse Through',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                   ),
                   Container(
                    padding: EdgeInsets.symmetric(horizontal:10),          
                   height: 70, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return CategoryTile(
                        imgUrl: categories[index].imgurl,
                        categoryName: categories[index].categoryName,

                      );
                    })
                        ),
         
                 SizedBox(height:20),
                 Container(
                  padding: EdgeInsets.only(left:10),
                   child: Text('Latest Headlines',style: TextStyle(fontSize:25,color: Colors.black,fontWeight: FontWeight.bold )),
                 ),
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
        ),),
         ),
      );
  }
}


class CategoryTile extends StatelessWidget {
  final String imgUrl,categoryName;
  CategoryTile({this.imgUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Categories(
             category : categoryName.toLowerCase(),
           ))
           );
          },
          child: Container(
         margin: EdgeInsets.only(right:15),
         child: Stack(
          children: <Widget>[
               ClipRRect(
                 borderRadius: BorderRadius.circular(5),
                 child: CachedNetworkImage(imageUrl : imgUrl,height:70,width:130,fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.center,
             height:70,
             width:130,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5),
               color: Colors.black54,
             ),
             child: Text(categoryName,style: TextStyle(color: Colors.white,fontSize: 15)),
          )
          ]      
      )
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

