import 'package:e_news_app/SRC/Screens/Tabbarscreens/allnewsscreen.dart';
import 'package:e_news_app/SRC/Screens/Tabbarscreens/popularnewsscreen.dart';
import 'package:e_news_app/SRC/Screens/Tabbarscreens/specificnews.dart';
import 'package:e_news_app/SRC/Screens/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
// import 'package:e_news_app/SRC/Components/dropdown.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  var date = DateTime.now();
  // DateFormat('EEEE').format(date)
  static const List<String> list = <String>[
    "Select",
    "All News",
    "Top Headline",
    "Trending",
    "Sports",
  ];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            toolbarHeight: 120,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat('EEEE').format(date)},${DateFormat('MMMM').format(date)}_${date.day}',
                  style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                      letterSpacing: 2),
                ),
                Text(
                  'Daily Feed',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight:
                          Theme.of(context).textTheme.titleMedium!.fontWeight,
                      color: Theme.of(context).textTheme.titleLarge!.color),
                ),
                dropdownValue == 'Select'
                    ? Text(
                        '',
                        style: TextStyle(
                            fontSize: 0,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontWeight,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color),
                      )
                    : Text(
                        dropdownValue,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontWeight,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color),
                      )
              ],
            ),
            actions: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: Colors.black
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      underline: Container(
                        height: 1.5,
                        color: Color.fromARGB(255, 0, 150, 136),
                      ),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                // color: Theme.of(context).textTheme.titleLarge!.color
                                ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 12),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SearchScreen();
                              },
                            ));
                          },
                          icon: Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 25,
                            color: Theme.of(context).iconTheme.color,
                          ))),
                ],
              )
            ],
          ),
          body: AllNews(
            value: dropdownValue,
          ),
        ));
  }
}
