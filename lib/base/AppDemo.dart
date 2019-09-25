import 'package:flutter/material.dart';
import './HomeApp.dart';
import './PersonApp.dart';
import './SearchApp.dart';
class AppDemo extends StatefulWidget {
  @override
  _AppDemoState createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
  int _currentIndex = 0;
  List _bodys = [HomeApp(),SearchApp(),PersonApp()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APP"),centerTitle: true,
      ),
      body: this._bodys[this._currentIndex],
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index){
          setState(() {
           this._currentIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text("搜索")),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的")),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.space_bar,color: Colors.blue,),
              title:Text("我的空间") ,
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.blue),
              title:Text("个性签名") ,
            ),
            ListTile(
              leading: Icon(Icons.people,color: Colors.blue),
              title:Text("qq达人") ,
            ),
          ],
        ),
        )
      ),
    );
  }
}