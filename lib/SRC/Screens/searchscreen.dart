import 'dart:convert';

import 'package:e_news_app/SRC/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var size, height, width;
  TextEditingController textController = TextEditingController();
  String displayText = "";

  List articles = [];
  Future<void> getdata() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=${textController.text}&apiKey=395fb06c3bda4679b9f617965fdc30d8'));

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
    setState(() {
      displayText = textController.text;
      getdata();
    });
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: width,
            color: Theme.of(context).textTheme.displayMedium!.color,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      onChanged: (text) {
                        text = textController.text;
                        getdata();
                      },
                      controller: textController,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      decoration: InputDecoration(
                        filled: true,
                        labelStyle: TextStyle(fontSize: 12),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(FontAwesomeIcons.magnifyingGlass))
              ],
            ),
          ),
          Expanded(
              child: Container(
            // color: Colors.green,
            child: Container(
                width: width,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RefreshIndicator(
                  onRefresh: () {
                    return getdata();
                  },
                  child: displayText != '' ? ListView.builder(
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
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,

                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return WebViewScreen(
                                          source: articles[index]['source']
                                              ['name'],
                                          url: articles[index]['url']);
                                    },
                                  ));
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            padding: EdgeInsets.only(
                                                right: 12, top: 15),
                                            child: RichText(
                                                text: TextSpan(
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'By\t\t',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .color)),
                                                  TextSpan(
                                                      text: articles[index]
                                                          ['source']['name'],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
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
                            
                          ],
                        ),
                      );
                    },
                  ): Center(
                    child: Text('No Result',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleMedium!.color
                    ),),
                  ),
                )),
          )),
        ],
      ),
    );
  }
}
