import 'package:flutter/material.dart';
import 'News.dart';
import 'NewsItem.dart';


class NewsList extends StatelessWidget{

  final List<News> newsList;

  NewsList(this.newsList);


  @override
  Widget build(BuildContext context) {

    return _listView(context);
  }

  ListView _listView(context){
    return ListView.builder(
      scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8.0),
         shrinkWrap: false,
         itemCount: newsList.length,
         itemBuilder: (context,int) {
          return NewsCard(newsList[int]);

        }
    );

  }

}