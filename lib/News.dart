import 'Source.dart';
class News {

  String title;

  String author;

  String description;

  String content;

  Source source;

  String publishedAt;

  String urlToImage;

  News({this.title,this.author,this.description,this.content,this.source,this.publishedAt,this.urlToImage});

  factory News.fromJson(Map<String,dynamic> json){
    return News(
      title:json['title'].toString(),
      author:json['author'].toString(),
      description:json['description'].toString(),
      content:json['content'].toString(),
      source:Source.fromJson(json['source']),
      publishedAt:json['publishedAt'].toString(),
      urlToImage:json['urlToImage'].toString()
    );
  }

}
