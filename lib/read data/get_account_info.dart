import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetFullName extends StatelessWidget {
  final String fullName;

  GetFullName({required this.fullName});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');



    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(fullName).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['first name']} ' + data['last name'],);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class GetuserName extends StatelessWidget {
  final String userName;

  GetuserName({required this.userName});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');


    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userName).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('@'+ data['username']);
      }
      return Text('Loading ...');
    }),
    );
  }
}


class Getanime1Name extends StatelessWidget {
  final String anime1Name;

  Getanime1Name({required this.anime1Name});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime1Name).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('1. '+ data['anime 1']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime2Name extends StatelessWidget {
  final String anime2Name;

  Getanime2Name({required this.anime2Name});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime2Name).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('2. '+ data['anime 2']);
      }
      return Text('Loading ...');
    }),
    );
  }
}


class Getanime3Name extends StatelessWidget {
  final String anime3Name;

  Getanime3Name({required this.anime3Name});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime3Name).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('3. '+ data['anime 3']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime4Name extends StatelessWidget {
  final String anime4Name;

  Getanime4Name({required this.anime4Name});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime4Name).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('4. '+ data['anime 4']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime5Name extends StatelessWidget {
  final String anime5Name;

  Getanime5Name({required this.anime5Name});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime5Name).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('5. '+ data['anime 5']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime1Note extends StatelessWidget {
  final String anime1Note;

  Getanime1Note({required this.anime1Note});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime1Note).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('      - '+ data['anime note 1']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime2Note extends StatelessWidget {
  final String anime2Note;

  Getanime2Note({required this.anime2Note});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime2Note).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('      - '+ data['anime note 2']);
      }
      return Text('Loading ...');
    }),
    );
  }
}


class Getanime3Note extends StatelessWidget {
  final String anime3Note;

  Getanime3Note({required this.anime3Note});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime3Note).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('      - '+ data['anime note 3']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime4Note extends StatelessWidget {
  final String anime4Note;

  Getanime4Note({required this.anime4Note});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime4Note).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('      - '+ data['anime note 4']);
      }
      return Text('Loading ...');
    }),
    );
  }
}

class Getanime5Note extends StatelessWidget {
  final String anime5Note;

  Getanime5Note({required this.anime5Note});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference animes = FirebaseFirestore.instance.collection('animes');


    return FutureBuilder<DocumentSnapshot>(
      future: animes.doc(anime5Note).get(),
      builder: ((context, snapshot) 
    {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('      - '+ data['anime note 5']);
      }
      return Text('Loading ...');
    }),
    );
  }
}