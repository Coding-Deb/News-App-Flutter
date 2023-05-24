import 'dart:convert';

import 'package:e_news_app/SRC/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';

class PopularNews extends StatefulWidget {
  const PopularNews({super.key});

  @override
  State<PopularNews> createState() => _PopularNewsState();
}

class _PopularNewsState extends State<PopularNews> {
  var size, height, width;
  List articles = [];
  Future<void> getdata() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=395fb06c3bda4679b9f617965fdc30d8'));
    var jsondata = jsonDecode(response.body);
    setState(() {
      articles = jsondata['articles'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Container(
          width: width,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return WebViewScreen(
                      source: articles[index]['source']['name'],
                      url: articles[index]['url']);
                },
              ));
            },
            child: Column(
              children: [
                Container(
                  // height: 100,
                  color: Theme.of(context).textTheme.displaySmall!.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      articles[index]['urlToImage'] != null
                          ? Image.network(
                              articles[index]['urlToImage'],
                              height: 140,
                              width: 110,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assests/Images/nophoto.jpg',
                              height: 140,
                              width: 110,
                              fit: BoxFit.fill,
                            ),
                      Column(
                        children: [
                          Container(
                              width: 1 / 1.4 * width,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                articles[index]['title'],
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color),
                              )),
                          Container(
                            width: 1 / 1.4 * width,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 12, top: 15),
                            child: RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'By\t\t',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color)),
                              TextSpan(
                                  text: articles[index]['source']['name'],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color)),
                            ])),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).textTheme.displayMedium!.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.thumbsUp)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.comment)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.shareNodes)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}