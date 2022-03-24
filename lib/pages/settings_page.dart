import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20,bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('In app purchases',style: TextStyle(color: Colors.grey),),
            ),
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Text('Remove Ads',style: TextStyle(color: Colors.black,fontSize: 16),)
                  ),
                  Text('6 000 IQD',style: TextStyle(color: Colors.grey,fontSize: 16),)
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Contact us',style: TextStyle(color: Colors.grey),),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                  onPressed: (){},
                  child: Text('Report Problem',style: TextStyle(color: Colors.black,fontSize: 16),)
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                  onPressed: (){},
                  child: Text('Suggest Improvement',style: TextStyle(color: Colors.black,fontSize: 16),)
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 1,
              color: Colors.grey,
            ),

          ],
        ),
      ),
    );
  }
}
