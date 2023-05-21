import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/color_manager.dart';

appMessage({required String text}){

  Get.snackbar ("   $text ", '',
      icon:const Icon(Icons.app_shortcut,color:ColorsManager.white,size:33,)
  );
}