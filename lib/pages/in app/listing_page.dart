import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_hof_book_nook/pages/in%20app/account_page.dart';
import 'package:the_hof_book_nook/pages/in%20app/home_page.dart';
import 'package:the_hof_book_nook/pages/sign%20ins/login_page.dart';
import 'package:the_hof_book_nook/read%20data/get_textbook_info.dart';

class MyListingsPage extends StatefulWidget {
  const MyListingsPage({super.key});

  @override
  State<MyListingsPage> createState() => _MyListingsPageState();
}

class _MyListingsPageState extends State<MyListingsPage> {

  final user = FirebaseAuth.instance.currentUser!;

  List<String> myListingRefernces = []; 

  //get animeNames
  Future getTextbooks() async {
    await FirebaseFirestore.instance.collection('textbooks')
    .where('Seller', isEqualTo: user.email)
    .get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) {
          print(document.reference.id);
          myListingRefernces.add(document.reference.id);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
         const FittedBox(
           child: Padding(
             padding: EdgeInsets.only(left: 1.0),
             child: Align(
              alignment: Alignment.centerLeft,
              child: Text("My Listings")
              ),
           ),
         ),
    ),


    body: 
    // // Center(
    // //     child: ListView(children: <Widget>[
    // //     Container(
    // //         padding: const EdgeInsets.all(10),
    // //         child: ButtonBar(
    // //           alignment: MainAxisAlignment.center,
    // //           mainAxisSize: MainAxisSize
    // //               .min, // this will take space as minimum as posible(to center)
    // //           children: <Widget>[
    // //             ElevatedButton(
    // //               onPressed: () {
    // //                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
    // //                return HomePage();
    // //                 }));
    // //               }, // "route" to home page 
    // //               child: 
    // //                 Text('Home'),
    // //             ),
    // //             ElevatedButton(
    // //               onPressed: () {
    // //                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
    // //                return MyListingsPage();
    // //                 }));
    // //               }, // route to my page ... this page ...
    // //               child: Text('My Listings', 
    // //                 style: TextStyle(fontWeight: FontWeight.w900),),
    // //             ),
    // //             ElevatedButton(
    // //               onPressed: () {
    // //                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
    // //                return accountPage();
    // //                 }));
    // //               }, // route to account page
    // //               child: Text('My Account'),
    // //             ),
    // //           ],
    // //         ),),],),),


           SizedBox(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Column(
                   children: [
                     Expanded(
                       child: FutureBuilder(
                       future: getTextbooks(),
                       builder:(context, snapshot) {
                         return ListView.builder(
                           itemCount: myListingRefernces.length,
                           itemBuilder: ((context, index) {
                           if(myListingRefernces.isNotEmpty){
                             return ListTile(
                               title: GetTextbook(textbookForSale: myListingRefernces[index],),
                               subtitle: GetPrice(priceForSale: myListingRefernces[index]),
                               );
                             }
                           else{
                             return SizedBox(height:20);
                             }
                           }),);
                            },
                          ),
                        ),
                   ],
                 ),
               ),
             ),
           ),
        
      


    );
  }
}