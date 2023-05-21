import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app/presentation/resources/color_manager.dart';
import 'package:get/get.dart';
import 'country_view.dart';

class SplashView extends StatefulWidget
{
  const SplashView({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();

}
class _MySplashScreenState extends State<SplashView>
{
  startTimer()
  {

    Timer(const Duration(seconds: 3), () async
    {

      Get.offAll(const CountryView());

    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    return
      Scaffold(

          appBar: AppBar(
            toolbarHeight: 10,
            backgroundColor:ColorsManager.primary,
          ),
          body:
          Container(
            color:    ColorsManager.primary2,
            child:   Center(
              child: Container(
                  color:ColorsManager.primary2,
                  height: 290, child:
              CircleAvatar(
                  backgroundColor: ColorsManager.primary,
                  radius: 120,
                  child: Image.asset('assets/images/logo.jpg',fit:BoxFit.fill,))),
            ),
          )
      );
  }
}
