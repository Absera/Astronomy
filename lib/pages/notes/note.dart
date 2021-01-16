import 'package:flutter/material.dart';
import 'package:astronomy/pages/color.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class Note extends StatelessWidget {
  final String title;
  final String body;

  Note({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    CustomColor customColor = CustomColor();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[700],
                ), // set your color here
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
              ),
              elevation: 1,
              backgroundColor: Colors.grey[900],
              expandedHeight: 100,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  title,
                  style: TextStyle(
                      color: Colors.grey[700],
                      letterSpacing: 2.0,
                      fontSize: 16,
                      fontFamily: 'Montserrat'),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.fromLTRB(4, 20, 4, 20),
          child: FutureBuilder(
              future: rootBundle.loadString("data/${body}.md"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                        data: snapshot.data,
                        styleSheet: MarkdownStyleSheet(
                          textScaleFactor: 1.2,
                          // textAlign: WrapAlignment.center,
                          // h1Align: WrapAlignment.center,
                        ),
                      );}
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
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
