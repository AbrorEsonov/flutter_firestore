import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWordsPage extends StatefulWidget {
  const MyWordsPage({Key? key}) : super(key: key);

  @override
  State<MyWordsPage> createState() => _MyWordsPageState();
}

class _MyWordsPageState extends State<MyWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade300,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 18),
              prefixIcon: Icon(CupertinoIcons.search,color: Colors.black,),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.plus),
          onPressed: (){},
        ),
      ),
    );;
  }
}
