import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/image/image_list.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  //这是你应用的根部局
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter',

      theme: new ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red

      ),
      home: new Scaffold(appBar: 
        new AppBar(title: new Text('GankMeizhi'),)
        ,body: new GankMeizhiPage(),)
    );
  }
}




