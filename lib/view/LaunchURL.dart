import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchURL extends StatefulWidget {
  @override
  _LaunchURLState createState() => _LaunchURLState();
}

class _LaunchURLState extends State<LaunchURL> {
  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("APP"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text('打开浏览器'),
            ),
            RaisedButton(
              child: Text("拨打电话"),
              onPressed: () async {
                const tel = "tel:10086";
                if (await canLaunch(tel)) {
                  await launch(tel);
                } else {
                  throw "Conld not launch $tel";
                }
              },
            ),
          ],
        )));
  }
}
