
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:flutter/material.dart';
import 'package:shop_app/presentation/resources/color_manager.dart';
import 'package:get/get.dart';
import '../../widgets/Custom_Text.dart';
import '../products/product_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 70,
        title:Custom_Text(text: 'Shop App',fontSize: 22,color:ColorsManager.primary,
        alignment:Alignment.center,
        ),
        backgroundColor:ColorsManager.primary2,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CatWidget(),
            SizedBox(height: 20,),
            ProductsWidget()
          ],
        ),
      ),
    );
  }
}

 Widget ProductsWidget(){
   return Container(
     height: 4000,
     child:StreamBuilder(
         stream:
         FirebaseFirestore.instance.collection('products')
             .snapshots(),
         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
           if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
           switch (snapshot.connectionState) {
             case ConnectionState.waiting:
               return  const Center(child: CircularProgressIndicator());
             default:
               return Expanded(
                 child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           crossAxisSpacing: 2,
           mainAxisSpacing: 4,
           ),
           physics: NeverScrollableScrollPhysics(),
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
                                       height: 120,
                                       child: Image.network(posts['image'])),
                                   const SizedBox(height: 5,),
                                   Custom_Text(text: posts['name'],fontSize:20,alignment:Alignment.center,),
                                   const SizedBox(height: 5,),

                                   RatingBar.builder(
                                     itemSize:20,
                                     initialRating : double.parse(  posts['rate'].toString()),
                                     minRating: 1,
                                     direction: Axis.horizontal,
                                     allowHalfRating: true,
                                     itemCount: 5,
                                     itemPadding:
                                     const EdgeInsets.symmetric(horizontal: 1.0),
                                     itemBuilder: (context, _) => const Icon(
                                       Icons.star,
                                       color: Colors.yellow,
                                     ),
                                     unratedColor:Colors.grey,
                                     onRatingUpdate: (rating) {
                                       print(rating);
                                     },
                                   ),

                                   const SizedBox(height: 5,),
                                   Text('dd',style:TextStyle(fontSize: 22),),

                                   Custom_Text(text: posts['price'].toString(),fontSize:20,alignment:Alignment.center,),

                                 ],
                               ),
                             ),
                             onTap:(){
                               Get.to(ProductDetailsView(
                                 posts: posts,
                               ));
                               print(posts['name']);

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

 Widget CatWidget(){

  return Container(
    height: 120,
    child:StreamBuilder(
        stream:
        FirebaseFirestore.instance.collection('categories')
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
                    scrollDirection:Axis.horizontal,
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
                                      height: 70,
                                      child: Image.network(posts['image'])),
                                  const SizedBox(height: 4,),
                                  Custom_Text(text: posts['name'],fontSize:20,alignment:Alignment.center,),
                                  const SizedBox(height: 4,)
                                ],
                              ),
                            ),
                            onTap:(){

                              print(posts['name']);
                             // Get.to(HomeView());
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