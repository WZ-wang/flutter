import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sy_flutter_alipay/sy_flutter_alipay.dart';

class Alipay extends StatefulWidget {
  @override
  _AlipayState createState() => _AlipayState();
}

class _AlipayState extends State<Alipay> {
  _alipay() async {
    var payInfo = await Dio().get("http://160.238.86.82/alipay/");
    var res = payInfo.data;
    var result = await SyFlutterAlipay.pay(res,
        // urlScheme: '你的ios urlScheme', //前面配置的urlScheme
        // isSandbox: true //是否是沙箱环境，只对android有效
        );
        print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("支付宝"),
          centerTitle: true,
        ),
        body: Center(
          child: RaisedButton(
            child: Text("支付"),
            onPressed: _alipay,
          ),
        ));
  }
}
