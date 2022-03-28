import 'package:flutter/material.dart';
import 'package:flutter_lauch_demo/splash_screen.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // //默认启动页
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(primarySwatch: Colors.blue,),
    //   home:  MyHomePage(),
    // );

    //网络启动页
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home:  SplashPage(),
      routes: <String, WidgetBuilder>{ // 路由
        '/index': (BuildContext context) => MyHomePage()
      },
    );
  }
}


