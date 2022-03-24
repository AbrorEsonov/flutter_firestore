import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mywords/pages/home_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static final String id = 'splash_page';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _initTimer(){
    Timer(Duration(seconds: 2),(){
        Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(50),
          color: Colors.white,
          child: Stack(
            children: [
              Center(
                child: Image.asset('assets/images/splash_page.png'),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text('IMPROVE YOUR VOCABULARY',
                        style: TextStyle(fontSize: 17,color: Colors.black87,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
