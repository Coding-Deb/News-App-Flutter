import 'package:e_news_app/SRC/Screens/Login-Signup/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();
    String displayText1 = "";
    String displayText2 = "";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 1 / 5.2 * height,
                width: width,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_dn6rwtwl.json')),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: textController1,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[500],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
             Container(
              margin: EdgeInsets.symmetric(vertical: 8),
               child: TextField(
                controller: textController2,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[500],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
                         ),
             ),
            
            Container(
              margin: EdgeInsets.symmetric(vertical: 17),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    displayText1 = textController1.text;
                    displayText2 = textController2.text;
                    Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ));
                  });
                },
                child: Text(
                  'Register Here',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge!.color),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[500],
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'OR',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge!.color),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).textTheme.titleLarge!.color,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).textTheme.titleLarge!.color,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).textTheme.titleLarge!.color,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.ellipsis,
                        color: Theme.of(context).textTheme.titleSmall!.color,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
