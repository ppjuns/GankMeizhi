import 'dart:convert';
import 'package:meta/meta.dart';

class ImageSource {
  final String id;
  final String createdAt;
  final String desc;
  final String publishedAt;
  final String source;
  final String type;
  final String url;
  final String who;


  ImageSource({
    @Required() this.id,
    @Required() this.createdAt,
    @Required() this.desc,
    @Required() this.publishedAt,
    @Required() this.source,
    @Required() this.type,
    @Required() this.url,
    @Required() this.who
  });


  static List<ImageSource> allFromResponse(String json) {
    return JSON.decode(json)['results']
        .map((obj) => ImageSource.fromMap(obj))
        .toList();
  }


  static ImageSource fromMap(Map map) {
    return new ImageSource(

        id: map['_id'],
        createdAt: map['createdAt'],
        desc: map['desc'],
        publishedAt: map['publishedAt'],
        source: map['source'],
        type: map['type'],
        url: map['url'],
        who: map['who']


    );
  }
}