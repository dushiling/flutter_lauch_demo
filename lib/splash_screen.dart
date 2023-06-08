import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

import 'package:flutter_lauch_demo/widgets/skip_down_time_progress.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String netImgUrl = '';

  // String netImgUrlPlaceholder = 'https://hbimg.b0.upaiyun.com/bb7e3b7ba10a607e0efd72b23087fa5415ca3cd040cc-7Ncw9V_fw236';//一个loading的图片

  @override
  void initState() {
    super.initState();

    //模拟广告图接口请求
    Future.delayed(Duration(microseconds: 1000), () {

         netImgUrl = 'https://img2.baidu.com/it/u=1170834292,3580907519&fm=253&fmt=auto&app=138&f=JPG?w=500&h=889';
         // netImgUrl='';

      //有广告页：netImgUrl不为空
      if (netImgUrl.length > 0) {

        /**刷新页面使广告图显示**/
        setState(() {});


        //无广告页：netImgUrl为空""
      } else {
        /**跳转到主页**/
        Future.delayed(Duration(microseconds: 10), goIndexPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[

      //普通写法
      Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child:  netImgUrl.length>0 ?
               Image.network(netImgUrl, fit: BoxFit.fill)
              :Image.asset("images/splash.png", fit: BoxFit.fill)//未请求回来之前，用启动页图片作为占位图
      ),

      // // 使用 CachedNetworkImage
      // Container(
      //     constraints: BoxConstraints.expand(),
      //     color: Colors.white,
      //     child: CachedNetworkImage(
      //     placeholder: (context, url) => Image.asset("images/splash.png", fit: BoxFit.fill),////未请求回来之前，用启动页图片作为占位图
      //     imageUrl: netImgUrl.isNotEmpty? netImgUrl : netImgUrlPlaceholder,//在netImgUrl请求回来之前占位url，防止CachedNetworkImage加载空url报错
      //     fit: BoxFit.fill,
      //     errorWidget: (context, url, error) => Image.asset("images/splash.png", fit: BoxFit.fill))
      // ),


      //倒计时：跳过
      Visibility(
        visible: netImgUrl.length>0 ,
        child: Positioned(
            child: SkipDownTimeProgress(
                color: Colors.red,
                radius: 22.0,
                duration: Duration(seconds: 5),
                size: Size(25.0, 25.0),
                skipText: "跳过",
                onTap: () => goIndexPage(),
                onFinishCallBack: (bool value) {
                  if (value) goIndexPage();
                }),
            top: MediaQueryData.fromWindow(ui.window).padding.top + 20,
            right: 30),
      )
    ]);
  }

  // 跳转主页
  void goIndexPage() {
    print('进入了主页......');
    Navigator.of(context).pushReplacementNamed('/index');
  }
}
