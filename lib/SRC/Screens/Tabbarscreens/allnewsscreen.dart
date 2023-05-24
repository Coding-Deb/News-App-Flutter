import 'dart:convert';

import 'package:e_news_app/SRC/Screens/webview.dart';
import 'package:e_news_app/SRC/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AllNews extends StatefulWidget {
  final value;
  const AllNews({super.key, this.value});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  var size, height, width;
  List articles = [];
  Future<void> getdata() async {
    var response = await http.get(Uri.parse(
      widget.value == 'All News'
          ? 'https://newsapi.org/v2/everything?q=world&apiKey=395fb06c3bda4679b9f617965fdc30d8'
          : (widget.value == 'Top Headline'
              ? 'https://newsapi.org/v2/top-headlines?country=us&apiKey=395fb06c3bda4679b9f617965fdc30d8'
              : 'https://newsapi.org/v2/everything?q=${widget.value}&apiKey=395fb06c3bda4679b9f617965fdc30d8'),
    ));

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
    bool value = false;
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () {
        return getdata();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Container(
                  // height: 100,
                  color: Theme.of(context).textTheme.displaySmall!.color,

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
                    child: Container(
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
                          onPressed: () {
                            setState(() {
                              value = !value;
                            });
                          },
                          icon: value == true
                              ? Icon(Icons.thumb_up_alt_outlined)
                              : Icon(Icons.thumb_up_alt_sharp)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.comment)),
                      IconButton(
                          onPressed: () {
                            Share.share('${articles[index]['url']}');
                          },
                          icon: Icon(FontAwesomeIcons.shareNodes)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
