import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
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
              hintStyle: TextStyle(fontSize: 18,),
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
    );
  }
}
