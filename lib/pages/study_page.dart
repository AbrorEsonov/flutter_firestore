import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  int _value = 1;
  int _valueWords = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Container(
                 // padding: EdgeInsets.all(20),
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: TabBar(
                    unselectedLabelColor: Colors.teal,
                    indicator: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: [
                      Tab(text: 'Words',),
                      Tab(text: 'Translations',),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade300,
                          child: Text('TRAINING TYPE',style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.rectangle_stack),
                            SizedBox(width: 10,),
                            Text('Cards',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 1,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.wand_stars_inverse),
                            SizedBox(width: 10,),
                            Text('Quiz',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.keyboard),
                            SizedBox(width: 10,),
                            Text('Grammar',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 3,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade300,
                          child: Text('WORD LISTS',style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.keyboard),
                            SizedBox(width: 10,),
                            Text('All words',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 1,
                              groupValue: _valueWords,
                              onChanged: (value){
                                setState(() {
                                  _valueWords = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade300,
                          child: Text('TRAINING TYPE',style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.rectangle_stack),
                            SizedBox(width: 10,),
                            Text('Cards',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 1,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.wand_stars_inverse),
                            SizedBox(width: 10,),
                            Text('Quiz',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.keyboard),
                            SizedBox(width: 10,),
                            Text('Grammar',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Radio(
                              value: 3,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value as int;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade300,
                          child: Text('WORD LISTS',style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text('All words',style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Text('0 words'),
                            SizedBox(width: 10,),
                            Radio(
                              value: 1,
                              groupValue: _valueWords,
                              onChanged: (value){
                                setState(() {
                                  _valueWords = value as int;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ]
                ),
              )
            ],
          ),
        )
    );
  }
}
