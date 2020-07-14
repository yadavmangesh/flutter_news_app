import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Utils.dart';
import 'News.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  const NewsDetail({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
//
          height: 250,
          child: FadeInImage.assetNetwork(
            placeholder: 'image/hey.png',
            image: news.urlToImage,
            fit: BoxFit.fitWidth,
            matchTextDirection: true,
          ),
          width: MediaQuery.of(context).size.width,

//                 ),
        ),
        Row(
          children: <Widget>[
            Container(
              child: Text(
                "Published At :" + Utils.getPublishDate(news.publishedAt),
                style: TextStyle(letterSpacing: 0.1, fontSize: 18),
              ),
              padding: EdgeInsets.all(8),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.bookmark_border),
                    onPressed: () {},
                    iconSize: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                    iconSize: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.all(8),
            child: Text(
              news.description,
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.1,
                  wordSpacing: 0.2,
                  fontWeight: FontWeight.w200),
            ))
      ],
    )));
  }
}
