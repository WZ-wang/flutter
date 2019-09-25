import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  String _state = "";
  var subscription;
  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          if(result == ConnectivityResult.mobile){
            setState(() {
             this._state="手机网" ;
            });
          }else if(result == ConnectivityResult.wifi){
             setState(() {
             this._state="wifi" ;
            });
          }else{
            setState(() {
             this._state="没有网了" ;
            });
          }
    });
  }
  @override
dispose() {
  super.dispose();

  subscription.cancel();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("网洛状态"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("当前网洛状态：${this._state}"),
        ));
  }
}
