import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app/image/image.dart';
import 'package:url_launcher/url_launcher.dart';


class GankMeizhiPage extends StatefulWidget {

  createState() => new GankMeizhiState();

}

class GankMeizhiState extends State<GankMeizhiPage> {
  var _ipAddress = 'Unkonwn';

  List<ImageSource> images = [];

  @override
  void initState() {
    super.initState();
    getImagesData();
  }

  getImagesData() async {
    var url = 'http://gank.io/api/data/%E7%A6%8F%E5%88%A9/100/1';
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        print(json);
        images = ImageSource.allFromResponse(json);
      } else {
        result = 'Http status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting';
    }

    if (!mounted) return;
    setState(() {
      print(images.first.url);
    });
  }


  @override
  Widget build(BuildContext context) {
    var content;
    if (images.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = _buildSuggestions(images);
    }


    return new Scaffold(
      body: content,
    );
  }
}

Widget _buildSuggestions(List<ImageSource> images) {
  return new ListView.builder(
      //padding: const EdgeInsets.all(16.0),


      itemBuilder: (context, i) {
        // Add a one-pixel-high divider widget before each row in theListView.
        if (i.isOdd) return new Divider();


        final index = i ~/ 2;

        if (index >= images.length) {

        }
        return _buildRow(images[index]);
      }
  );
}


Widget _buildRow(images) {
  return new ListTile(
    title: new Image.network(
      images.url,),

  );
}
