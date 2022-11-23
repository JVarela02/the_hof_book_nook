// import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_hof_book_nook/auth/auth_page.dart';
import 'package:the_hof_book_nook/pages/in%20app/account_page.dart';
import 'package:the_hof_book_nook/pages/in%20app/listing_page.dart';
import 'package:the_hof_book_nook/pages/in%20app/txtinput_page.dart';
import 'package:the_hof_book_nook/read%20data/get_account_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_hof_book_nook/read%20data/get_textbook_info.dart';
import 'package:the_hof_book_nook/read%20data/get_account_info.dart';
import '../sign ins/login_page.dart';
import '../sign ins/register_page.dart';


class HomePage extends StatefulWidget{
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final user = FirebaseAuth.instance.currentUser!;
   final _searchController = TextEditingController();
   String dropdownValue = "Search Type";
   var list = ["Search Type", "ISBN", "Author", "Title"];

   @override
   void dispose() {
     _searchController.dispose();
     super.dispose();
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
              child: Text("Home")
              ),
           ),
         ),

         actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
              onTap: () async {
                FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => false);
                Navigator.push(context,MaterialPageRoute(
                           builder: (context) {
                           return LoginPage(showRegisterPage: () {  },);
                          },
                        ), );
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
      Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize
                      .min, // this will take space as minimum as posible(to center)
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                       return HomePage();
                        }));
                      }, // route to account page
                      child: Text('Home'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                       return MyListingsPage();
                        }));
                      }, // route to my page ... this page ...
                      child: Text('My Listings'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                       return accountPage();
                        }));
                      },
                      child: Text('My Account', 
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
            ),
           

                SizedBox(height:20,),

          DropdownButton(
          value: dropdownValue,
          underline: Container(
          height: 2,
          color: Color.fromARGB(255, 105, 173, 222),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: list.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
             // This is called when the user selects an item.
            setState(() {
              dropdownValue = newValue!;
            });
          },
          ),

          SizedBox(height: 20,),

          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 207, 230, 247),
                    border: Border.all(color: const Color.fromARGB(255, 235, 235, 235),
                    width: 3),
                    borderRadius: BorderRadius.circular(6),
                   ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Criteria",
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton( 
                onPressed: 
                   () {
                    var route = MaterialPageRoute(
                      builder:(BuildContext context) => ResultsPage(dropdownValue: dropdownValue, searchCriteria: _searchController.text.toString()),
                      );
                    Navigator.of(context).push(route);
                    },
                child: Text("Search",
                  style: TextStyle(color: Colors.white),
                ),      
              ),
            ),


          ],
        ),

      ),

      );
    
  }

}


 class ResultsPage extends StatefulWidget {
   final String dropdownValue;
   final String searchCriteria;
   const ResultsPage({super.key, required this.dropdownValue, required this.searchCriteria});

   @override
   State<ResultsPage> createState() => _ResultsPageState();
 }

 class _ResultsPageState extends State<ResultsPage> {

   List<String> searchRefernces = []; 
  

   //get texbooks
   Future getTextbookResults() async {
    if(widget.dropdownValue == "ISBN"){
     await FirebaseFirestore.instance.collection('textbooks')
     .where('ISBN', isEqualTo: widget.searchCriteria.toString())
     .get().then(
       (snapshot) => snapshot.docs.forEach(
         (document) {
           print(document.reference.id);
           searchRefernces.add(document.reference.id);
         },
       ),
     );
    };
    if(widget.dropdownValue == "Author"){
      await FirebaseFirestore.instance.collection('textbooks')
     .where('Author', isEqualTo: widget.searchCriteria.toString())
     .get().then(
       (snapshot) => snapshot.docs.forEach(
         (document) {
           print(document.reference.id);
           searchRefernces.add(document.reference.id);
         },
       ),
     );
    }
    if(widget.dropdownValue == "Title"){
      await FirebaseFirestore.instance.collection('textbooks')
     .where('Title', isEqualTo: widget.searchCriteria.toString())
     .get().then(
       (snapshot) => snapshot.docs.forEach(
         (document) {
           print(document.reference.id);
           searchRefernces.add(document.reference.id);
         },
       ),
     );
    }
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
               child: Text("Search Results")
               ),
            ),
          ),
     ),

       body: 
       //Container(
         //child: 
         FutureBuilder(
         future: getTextbookResults(),
         builder:(context, snapshot) {
           return ListView.builder(
           itemCount: searchRefernces.length,
           itemBuilder: ((context, index) {
           if(searchRefernces.isNotEmpty){
              return ListTile(
               leading: Icon(Icons.camera_alt_rounded), // This will turn into photo of textbook
               title: GetTextbook(textbookForSale: searchRefernces[index],), //Once API is added this would turn into Title
               subtitle: GetCondition(conditionForSale: searchRefernces[index]), 
               trailing: GetPrice(priceForSale: searchRefernces[index]),
               onTap: null, // Will be used for "In Negotiations" if done
               );
            }
            else{
              return ColoredBox(
                color: Color.fromARGB(255, 60, 95, 42),
                child: SizedBox(height: 23, width: 67,),

                //child: Text("No Results Were Found")
                );
            }
            }),);
          },
         ),
     );
   }
 }