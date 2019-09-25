import 'package:flutter/material.dart';
import '../view/ImageWidget.dart';
import '../base/HomeApp.dart';
import '../base/PersonApp.dart';
import '../base/SearchApp.dart';
import '../news/NewsList.dart';
import '../news/NewsContent.dart';
import '../view/LaunchURL.dart';
import '../view/Video.dart';
import '../view/Alipay.dart';
import '../view/Network.dart';


final routes = {
  "/image" : (context) => ImageWidget(),
  "/home" : (context) => HomeApp(),
  "/person" : (context) => PersonApp(),
  "/search" : (context) => SearchApp(),
  "/newslist" : (context) => NewsList(),
  "/url" : (context) => LaunchURL(),
  "/video" : (context) => Video(),
  "/alipay" : (context) => Alipay(),
  "/net" : (context) => Network(),
  "/newscontent" : (context,{arguments}) => NewsContent(arguments:arguments),
};


var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};