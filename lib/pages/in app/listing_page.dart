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

  //get textbooks
  Future getTextbooks() async {
    await FirebaseFirestore.instance
        .collection('textbooks')
        .where('Seller', isEqualTo: user.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference.id);
              myListingRefernces.add(document.reference.id);
            },
          ),
        );
  }

  void showDialogBox(String index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('Change Status?'),
            content: Text('Do you want to change the status of this book?'),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () async {
                  final document = FirebaseFirestore.instance
                      .collection('textbooks')
                      .doc(index);
                  document.update({
                    'InNegotiations': true,
                  });
                  Navigator.of(context).pop();
                },
                child: Text('CHANGE TO \'In Negotiations\''),
              ),
              TextButton(
                //textColor: Colors.black,
                onPressed: () async {
                  final document = FirebaseFirestore.instance
                      .collection('textbooks')
                      .doc(index);
                  document.update({
                    'InNegotiations': false,
                  });
                  Navigator.of(context).pop();
                },
                child: Text('RESET STATUS'),
              ),
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('CANCEL'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 1.0),
            child: Align(
                alignment: Alignment.centerLeft, child: Text("My Listings")),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(
                            showRegisterPage: () {},
                          );
                        },
                      ),
                    );
                  },
                  child: const Text("Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //ListView(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage();
                    }));
                  }, // "route" to home page
                  child: Text('Home'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyListingsPage();
                    }));
                  }, // route to my page ... this page ...
                  child: Text(
                    'My Listings',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return accountPage();
                    }));
                  }, // route to account page
                  child: Text('My Account'),
                ),
              ],
            ),
          ),
          //],),

          SizedBox(
            height: 10,
          ),

          Expanded(
            child: FutureBuilder(
              future: getTextbooks(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: myListingRefernces.length,
                  itemBuilder: ((context, index) {
                    if (myListingRefernces.isNotEmpty) {
                      return ListTile(
                        leading: Icon(Icons
                            .camera_alt_rounded), // This will turn into photo of textbook
                        title: GetTextbook(
                          textbookForSale: myListingRefernces[index],
                        ), //Once API is added this would turn into Title
                        subtitle:
                            GetPrice(priceForSale: myListingRefernces[index]),
                        trailing: Icon(
                          Icons.square_outlined,
                        ),
                        onTap: () => showDialogBox(myListingRefernces[
                            index]), // Will be used for "In Negotiations" if done
                      );
                    } else {
                      return SizedBox(height: 20);
                    }
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
