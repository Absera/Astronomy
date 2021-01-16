import 'package:astronomy/pages/color.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key key}) : super(key: key);
  final CustomColor customColor = CustomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
      width: MediaQuery.of(context).size.width,
      // height: 900,
      decoration: BoxDecoration(
          // boxShadow: [BoxShadow(blurRadius: 10)],
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(55.0))),
      child: Center(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              Column(children: [
                Text(
                  "Content Writer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 3,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Column(
                  children: [
                    Card(
                      color: Colors.white,
                      borderOnForeground: true,
                      child: Column(children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: customColor.primary,
                            foregroundColor: Colors.white,
                            child: Text("K"),
                          ),
                          title: Text(
                            "Kaleab Million",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            (){};

                            // kaleab telegram
                          },
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: customColor.primary,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.mail),
                          ),
                          title: Text(
                            "Email",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            launch("mailto:abseratemesgen@gmail.com");

                            // kaleab mail
                          },
                        ),
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Developer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 3,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Column(
                  children: [
                    Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      child: Column(children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: customColor.primary,
                            foregroundColor: Colors.white,
                            child: Text("A"),
                          ),
                          title: Text(
                            "Absera Temesgen",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            (){};
                          },
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: customColor.primary,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.mail),
                          ),
                          title: Text(
                            "Email",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            launch("mailto:abseratemesgen@gmail.com");

                            // absera mail
                          },
                        ),
                      ]),
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
