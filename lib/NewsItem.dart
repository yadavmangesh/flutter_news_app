import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Utils.dart';
import 'new_detail.dart';
import 'News.dart';

class NewsCard extends StatefulWidget {
  final News news;

  NewsCard(this.news);

  @override
  _NewCardState createState() => _NewCardState(news);
}

class _NewCardState extends State<NewsCard> {
  final News news;
  Color colors = Colors.pink;

  _NewCardState(this.news);

  @override
  Widget build(BuildContext context) {
    return new Card(
//      child: Padding(
//        padding: const EdgeInsets.all(16.0),
//         child: Container(
      child: InkWell(

        borderRadius: BorderRadius.circular(8),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>NewsDetail(news: news),
          ));
        },
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(Utils.getInitial(news.source.sourceName),
                    style: TextStyle(
                      inherit: false,
                      color: Colors.white,
                    )),
              ),
              title: Text(news.source.sourceName),
              subtitle: Text(Utils.getAuther(news.author)),
            ),
            new Container(
//
              margin: EdgeInsets.only(bottom: 8, left: 8),
              child: Text(news.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2),
            ),
            new Container(
//
              height: 150,
              child: FadeInImage.assetNetwork(
                placeholder:'image/hey.png',
                image:news.urlToImage,
                fit: BoxFit.fitWidth,
                matchTextDirection: true,
              ),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,

//                 ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text("Expand"),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text("Visit Source"),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () {
                          setState(() {});
                        },
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
                )
              ],
            ),
          ],
        ),
      ),
//         ),
//      ),
    );
  }
}
