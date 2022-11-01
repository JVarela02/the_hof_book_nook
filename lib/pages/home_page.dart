// import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
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

  List<String> topAnimesreference = []; 

  //get animeNames
  Future getanimeName() async {
    await FirebaseFirestore.instance.collection('animes')
    .where('email', isEqualTo: user.email)
    .get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) {
          print(document.reference.id);
          topAnimesreference.add(document.reference.id);
        },
      ),
    );
  }


  Future CreateAnimeList() async {
    await getanimeName();
  }

  List<String> topAnimesNotesreference = []; 

  //get animeNames
  Future getanimeNotes() async {
    await FirebaseFirestore.instance.collection('animes')
    .where('email', isEqualTo: user.email)
    .get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) {
          print(document.reference.id);
          topAnimesNotesreference.add(document.reference.id);
        },
      ),
    );
  }

  Future CreateNotesList() async {
    await getanimeNotes();
  }


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



      body: 
      
      
      
      
    RefreshIndicator(
        onRefresh: () { return Future.delayed(Duration (seconds: 1));},
        child: 
        Center(
          child: Column(
      
        children: [

         Expanded(
               child: FutureBuilder(
                 future: CreateAnimeList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime1Name(anime1Name: topAnimesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:20);
                      }
                     }),);
                 },
               ),
             ),

        Expanded(
               child: FutureBuilder(
                 future: CreateNotesList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime1Note(anime1Note: topAnimesNotesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:20);
                      }
                     }),);
                 },
               ),
             ),
      
         Expanded(
               child: FutureBuilder(
                 future: CreateAnimeList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime2Name(anime2Name: topAnimesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:10);
                      }
                     }),);
                 },
               ),
             ),

        Expanded(
               child: FutureBuilder(
                 future: CreateNotesList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime2Note(anime2Note: topAnimesNotesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:20);
                      }
                     }),);
                 },
               ),
             ),
      
      
         Expanded(
               child: FutureBuilder(
                 future: CreateAnimeList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime3Name(anime3Name: topAnimesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height: 10,);
                      }
                     }),);
                 },
               ),
             ),

        Expanded(
               child: FutureBuilder(
                 future: CreateNotesList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime3Note(anime3Note: topAnimesNotesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:20);
                      }
                     }),);
                 },
               ),
             ),
      
         Expanded(
               child: FutureBuilder(
                 future: CreateAnimeList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime4Name(anime4Name: topAnimesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:10);
                      }
                     }),);
                 },
               ),
             ),

        Expanded(
               child: FutureBuilder(
                 future: CreateNotesList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime4Note(anime4Note: topAnimesNotesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:20);
                      }
                     }),);
                 },
               ),
             ),
      
         Expanded(
               child: FutureBuilder(
                 future: CreateAnimeList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime5Name(anime5Name: topAnimesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:10);
                      }
                     }),);
                 },
               ),
             ),

        Expanded(
               child: FutureBuilder(
                 future: CreateNotesList(),
                 builder:(context, snapshot) {
                   return ListView.builder(
                     itemCount: 1,
                     itemBuilder: ((context, index) {
                      if(topAnimesreference.isNotEmpty){
                       return ListTile(
                         title: Getanime5Note(anime5Note: topAnimesNotesreference[0],),
                       );
                      }
                      else{
                        return SizedBox(height:20);
                      }
                     }),);
                 },
               ),
             ),

        

              
        ]
      
        ),
      
          ),
      )
    );
    
  }

}