import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mywords/models/word_model.dart';

import '../services/api/firebase_api.dart';

class MyWordsPage extends StatefulWidget {
  const MyWordsPage({Key? key}) : super(key: key);

  @override
  State<MyWordsPage> createState() => _MyWordsPageState();
}

class _MyWordsPageState extends State<MyWordsPage> {

  final Stream<QuerySnapshot> _wordsStream = FirebaseFirestore.instance.collection('words').snapshots();

  final docs = FirebaseFirestore.instance.collection('words').doc();

  @override
  void initState() {
    print(docs.snapshots().first);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 18),
                prefixIcon: Icon(CupertinoIcons.search,color: Colors.black,),
              ),
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _wordsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['word']),
                        subtitle: Text(data['definition']),
                      );
                    }).toList()
                    );
                  },
                ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: FloatingActionButton(
            child: Icon(CupertinoIcons.plus),
            onPressed: (){},
          ),
        ),
      ),
    );;
  }
}
