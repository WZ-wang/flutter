import 'package:flutter/material.dart';
import 'package:imagelist/routes/routes.dart' as prefix0;
import './base/AppDemo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppDemo(),
      onGenerateRoute: prefix0.onGenerateRoute,
    );
  }
}


