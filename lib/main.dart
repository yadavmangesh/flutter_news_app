import 'dart:async';
import 'package:flutter/material.dart';
import 'News.dart';
import 'dart:convert';
import 'NewsList.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness:Brightness.light,
            primaryColor: Colors.pink[500],
            primaryColorDark: Colors.pink[800],
            accentColor: Colors.pink[300]),
        home: SafeArea(
          child: MyHomePage(
            title: 'News',
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<List<News>> fetchPost() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=46e9bb22cd074788b7df03c3d5c5d7b1');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print("responseJson " + responseJson.toString());
    return (responseJson['articles'] as List)
        .map((p) => News.fromJson(p))
        .toList();
  } else {
    throw Exception('Failed to load News');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<News>> newsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsList = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(
                  Icons.short_text,
                  size: 30,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Trending News",
                style: TextStyle(
                    letterSpacing: 0.1, fontSize: 22, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
//                  image: DecorationImage(
//                      fit: BoxFit.fitWidth,
//                      image: AssetImage("image/hey.png")
//                  )
              ),
            ),
            ListTile(
              title: Text("Top News"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text("Regional"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text("World News"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text("Bookmarked"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text("Liked"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
      body: Container(
          child: FutureBuilder<List<News>>(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //   return NewsList(snapshot.data);
            print("has Data");
            return new NewsList(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        },
      )),

    );
  }
}
