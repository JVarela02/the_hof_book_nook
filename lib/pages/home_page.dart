// import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_hof_book_nook/pages/account_page.dart';
import 'package:the_hof_book_nook/read%20data/get_account_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';


class HomePage extends StatefulWidget{
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:
         FittedBox(
           child: Padding(
             padding: const EdgeInsets.only(left: 1.0),
             child: Align(
              alignment: Alignment.centerLeft,
              child: Text(user.email!)
              ),
           ),
         ),

         actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
                child: const Text("Logout",
                style: TextStyle(
                  color : Colors.white,
                  fontWeight: FontWeight.bold,
                ))
                     ),
            ),
          )],
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
                  onPressed: null, // "route" to home page 
                  child: 
                    Text('Home', 
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  
                ),
                ElevatedButton(
                  onPressed: null, // route to my page ... this page ...
                  child: Text('My Listings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                   return accountPage();
                    }));
                  }, // route to account page
                  child: Text('My Account'),
                ),
              ],
            ),),],),),


      );
    
  }

}