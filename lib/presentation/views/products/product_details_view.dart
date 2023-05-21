import 'package:cloud_firestore/cloud_firestore.dart';

 import 'package:flutter/material.dart';
import 'package:shop_app/presentation/resources/color_manager.dart';
import 'package:shop_app/presentation/widgets/Custom_Text.dart';

class ProductDetailsView extends StatelessWidget {

  DocumentSnapshot  posts;

  ProductDetailsView({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 2,
         backgroundColor:ColorsManager.primary,
      ),
      body:ListView(
        children: [
          SizedBox(height: 20,),
          Container(height: 140,
          child:Image.network(posts['image']),
          ),
          SizedBox(height: 20,),
          Custom_Text(text: posts['name'],fontSize: 22,alignment:Alignment.center),
          SizedBox(height: 20,),
          Custom_Text(text: posts['des'],fontSize: 22,alignment:Alignment.center),
          SizedBox(height: 20,),
          Custom_Text(text: posts['price'].toString(),fontSize: 22,alignment:Alignment.center),
        ],
      ),
    );
  }

}
