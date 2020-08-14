
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/views/home.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List<Countries> locations = [
  Countries(location: 'Australia',flag:'australia.png',countryId: 'au'),
  Countries(location: 'Egypt',flag:'egypt.jpg',countryId: 'eg'),
  Countries(location: 'France',flag:'france.jpg',countryId: 'fr'),
  Countries(location: 'Germany',flag:'germany.png',countryId: 'de'),
  Countries(location: 'India',flag:'india.png',countryId: 'in'),
  Countries(location: 'Italy',flag:'italy.png',countryId: 'it'),
  Countries(location: 'UAE',flag:'uae2.png',countryId: 'ae'),
  Countries(location: 'USA',flag:'america.png',countryId: 'us'),
 ];

  @override
  Widget build(BuildContext context) {
   var ctheight = MediaQuery.of(context).size.height;
   return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('The',style: TextStyle(color: Colors.white,fontSize:25,fontFamily: 'Trajan',)),
              Text('News',style: TextStyle(color:Colors.blue,fontSize:25,fontFamily: 'Trajan',)),
              Text('Master',style: TextStyle(color: Colors.white,fontSize:25,fontFamily: 'Trajan',))
            ]
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: ctheight*0.9,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.red])),
       child: Column(children: <Widget>[
                SizedBox(height:10),
                Container(
                   padding: EdgeInsets.only(right:125),
                       child: Text('News From Everywhere:',style: TextStyle(color:Colors.black,fontSize: 23,fontWeight: FontWeight.bold),)
                ),
                 ListView.builder(
                   shrinkWrap: true,
       itemCount: locations.length,
       itemBuilder: (context,index){
        return Container(
          padding: EdgeInsets.fromLTRB(20,5,20,0),
          child: Card(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                 child: Container(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Home(
                     country : locations[index].countryId,
                   ))
                   );
                    },
                    title: Text(locations[index].location,style: TextStyle(color: Colors.black),),
                     leading: CircleAvatar(
                       backgroundImage: AssetImage('assets/${locations[index].flag}'),
                     ),
                    ),
                ),
              ),
          ),
        );
       },
       ),
              ],),
            )),
         
       
   );
  }
}


class Countries{
  String location;
  String flag;
  String countryId;
  Countries({this.location,this.countryId,this.flag});
 
 }