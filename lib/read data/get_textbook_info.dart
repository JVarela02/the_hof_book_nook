import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetTextbook extends StatelessWidget {
  final String textbookForSale;

  GetTextbook({required this.textbookForSale});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference textbooks = FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(textbookForSale).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['ISBN']} ',);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class GetPrice extends StatelessWidget {
  final String priceForSale;

  GetPrice({required this.priceForSale});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference textbooks = FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(priceForSale).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text("\$" + data['Price'],);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class GetCondition extends StatelessWidget {
  final String conditionForSale;

  GetCondition({required this.conditionForSale});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference textbooks = FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(conditionForSale).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['Condition']} ',);
      }
      return Text('Loading ...');
    }),
    );
  }
}
