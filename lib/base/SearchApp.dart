import 'package:flutter/material.dart';
import '../comment/Comment.dart';

class SearchApp extends StatefulWidget {
  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  var _info;
  _select() async {
    var username = await Storage.getString("name");
    setState(() {
      this._info = username;
    });
  }
  @override
  void initState() {
    super.initState();
    this._select();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("新闻列表"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/newslist");
            },
          ),
          RaisedButton(
            child: Text("添加"),
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: () async {
              await Storage.setString("name", "wangcei");
            },
          ),
          RaisedButton(
            child: Text("查询"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _select,
          ),
          RaisedButton(
            child: Text("删除"),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () async {
              await Storage.remove("name");
              this._select();
            },
          ),
          Text("${this._info}")
        ],
      ),
    );
  }
}
