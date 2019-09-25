import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List _list = [];
  int _page = 1;
  bool hasMore = true;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    this.getData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this.getData();
      }
    });
  }

  getData() async {
    var result = await Dio().get(
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}");
    var res = json.decode(result.data)["result"];
    setState(() {
      this._list.addAll(res);
      this._page++;
    });
    if (res.length < 20) {
      setState(() {
        this.hasMore = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻列表"),
          centerTitle: true,
        ),
        body: this._list.length > 0
            ? RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: this._list.length,
                  itemBuilder: (context, i) {
                    if (i == this._list.length - 1) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "${this._list[i]['title']}",
                              maxLines: 1,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/newscontent",
                                  arguments: {"aid": this._list[i]['aid']});
                            },
                          ),
                          Divider(),
                          _getMoreWidget()
                        ],
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "${this._list[i]['title']}",
                              maxLines: 1,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/newscontent",
                                  arguments: {"aid": this._list[i]['aid']});
                            },
                          ),
                          Divider()
                        ],
                      );
                    }
                  },
                ),
              )
            : _getMoreWidget());
  }

  Widget _getMoreWidget() {
    if (hasMore) {
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
    } else {
      return Center(
        child: Text("--没有了--"),
      );
    }
  }
}
