import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'dart:convert';

class NewsContent extends StatefulWidget {
  Map arguments;
  NewsContent({this.arguments});
  @override
  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State<NewsContent> {
  Map arguments;
  _NewsContentState(this.arguments);
  List _list = [];
  bool finish = true;
  @override
  void initState() {
    this.getData();
    super.initState();
    // print(this.arguments);
  }

  getData() async {
    var result = await Dio().get(
        "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments['aid']}");
    var res = json.decode(result.data)["result"];
    setState(() {
      this._list = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻详情"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            this.finish ? _getMoreWidget() : Text(""),
            Expanded(
                child: InAppWebView(
                    initialUrl:
                        "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
                    onProgressChanged:
                        (InAppWebViewController controller, int progress) {
                      print(progress);
                      if ((progress / 100) > 0.999) {
                        print("....");
                        setState(() {
                          this.finish = false;
                        });
                      }
                    }))
          ],
        ));
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("加载中..."),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
