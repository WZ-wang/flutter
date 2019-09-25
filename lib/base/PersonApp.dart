import 'package:flutter/material.dart';

class PersonApp extends StatefulWidget {
  @override
  _PersonAppState createState() => _PersonAppState();
}

class _PersonAppState extends State<PersonApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            child: Text("相机和图库"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/image");
            },
          ),
          RaisedButton(
            child: Text("外部应用"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/url");
            },
          ),
          RaisedButton(
            child: Text("播放视频"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/video");
            },
          ),
          RaisedButton(
            child: Text("支付宝"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/alipay");
            },
          ),
          RaisedButton(
            child: Text("网络状态"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/net");
            },
          ),
         
        ],
      ),
    );
  }
}
