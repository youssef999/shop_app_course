

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:flutter/material.dart';
import 'package:shop_app/presentation/resources/color_manager.dart';
import 'package:shop_app/presentation/views/Home/home_view.dart';
import 'package:shop_app/presentation/widgets/Custom_Text.dart';

class CountryView extends StatelessWidget {
   const CountryView({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         toolbarHeight: 2,
         backgroundColor:ColorsManager.primary,
       ),
       body:ListView(
         children: [
           const SizedBox(height: 20,),
           // SizedBox(
           //   height:200 ,
           //   child:Image.asset('assets/images/logo.jpg'),
           // ),
           const SizedBox(height: 20,),
           CountriesWidget()
         ],
       )
     );
   }
 }


 Widget CountriesWidget() {
    return Container(
     height: 700,
     child:StreamBuilder(
         stream:
         FirebaseFirestore.instance.collection('countries')
             .snapshots(),

         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

           if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
           switch (snapshot.connectionState) {
             case ConnectionState.waiting:
               return  const Center(child: CircularProgressIndicator());
               default:
               return Expanded(
                 child: ListView.builder(
                     itemCount: snapshot.data!.docs.length,
                     itemBuilder: (context, index) {
                       DocumentSnapshot posts = snapshot.data!.docs[index];
                       if(snapshot.data == null) return const CircularProgressIndicator();
                       return


                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: InkWell(
                             child: Container(
                               color: Colors.white,
                               child: Column(
                                 children: <Widget>[
                                   Container(
                                       width: 60,
                                       child: Image.network(posts['img'])),
                                   const SizedBox(height: 10,),
                                   Custom_Text(text: posts['name'],fontSize:20,alignment:Alignment.center,),
                                   const SizedBox(height: 10,)
                                 ],
                               ),
                             ),
                             onTap:(){

                               print(posts['name']);
                               Get.to(HomeView());
                             },
                           ),
                         );
                     }),
               );
           }
         }
     ),
   );
 }