import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetTextbook extends StatelessWidget {
  final String textbookForSale;

  GetTextbook({required this.textbookForSale});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference textbooks =
        FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(textbookForSale).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['ISBN']} ',
          );
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
    CollectionReference textbooks =
        FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(priceForSale).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          bool InNegotiations = data['InNegotiations'];
          if (!InNegotiations) {
            return Text(
              "\$" + data['Price'],
            );
          } else {
            return Text('In Negotiaitons');
          }
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
    CollectionReference textbooks =
        FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(conditionForSale).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['Condition']} ',
          );
        }
        return Text('Loading ...');
      }),
    );
  }
}

class GetEmail extends StatelessWidget {
  final String sellerEmail;

  GetEmail({required this.sellerEmail});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference textbooks =
        FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(sellerEmail).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['Seller']} ',
          );
        }
        return Text('Loading ...');
      }),
    );
  }
}

class GetNegotiations extends StatelessWidget {
  final String negotiations;

  GetNegotiations({required this.negotiations});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference textbooks =
        FirebaseFirestore.instance.collection('textbooks');

    return FutureBuilder<DocumentSnapshot>(
      future: textbooks.doc(negotiations).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['InNegotiations']} ',
          );
        }
        return Text('Loading ...');
      }),
    );
  }
}
