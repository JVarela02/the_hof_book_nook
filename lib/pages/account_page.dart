import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_hof_book_nook/pages/home_page.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {

   final user = FirebaseAuth.instance.currentUser!;


  // full Names list
  List<String> fullNames = [];

  //get fullNames
  Future getfullName() async {
    await FirebaseFirestore.instance.collection('users')
    .where('email', isEqualTo: user.email)
    .get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) {
          print(document.reference);
          fullNames.add(document.reference.id);
        },
      ),
    );
  }


  // user names
  List<String> userNames = [];

  //get userNames
  Future getuserName() async {
    await FirebaseFirestore.instance.collection('users')
    .where('email', isEqualTo: user.email)
    .get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) {
          print(document.reference);
          userNames.add(document.reference.id);
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
              child: Text("Account Page")
              ),
           ),
         ),
    ),

  body: Center(
          child: ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                   return HomePage();
                    }));
                  }, // route to account page
                  child: Text('Home'),
                ),
                ElevatedButton(
                  onPressed: null, // route to my page ... this page ...
                  child: Text('My Listings'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('My Account', 
                  style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),),],),),

    );
  }
}