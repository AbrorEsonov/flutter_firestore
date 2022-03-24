import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mywords/models/word_model.dart';


class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {

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
                            title: Text(data['lesson']),
                          );
                        }).toList()
                    );
                  },
                ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FloatingActionButton(
            child: Icon(CupertinoIcons.plus),
            onPressed: (){},
          ),
        ),
      ),
    );;
  }
}
