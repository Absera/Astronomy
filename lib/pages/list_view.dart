// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'package:astronomy/pages/notes/note.dart';

class ListViewTopic extends StatelessWidget {
  const ListViewTopic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: <Widget>[
              CustomListView(
                title: "The Nature of Astronomy",
                subtitle: "Brief introduction to the nature of astronomy",
                page: Note(title: "Astronomy", body: "1",),
              ),
              CustomListView(
                title: "A tour of the universe",
                subtitle: "We can now take a brief introductory tour of the universe",
                page: Note(title: "A Tour", body: "2",),
              ),
              CustomListView(
                title: "Astronomy vs Astrology",
                subtitle: "Brief contrast between Astronomy and Astrology",
                page: Note(title: "Astrology", body: "3",),
              ),
              CustomListView(
                title: "Observing the planets",
                subtitle: "How are planets observed and more",
                page: Note(title: "Planets", body: "4",),
              ),
              CustomListView(
                title: "Overview of our planetary system",
                subtitle: "How does our planetary system look like",
                page: Note(title: "Overview", body: "5",),
              ),
              CustomListView(
                title: "Origin of the solar system",
                subtitle: "Overview of the origin of the solar system",
                page: Note(title: "The solar system", body: "6",),
              ),
              CustomListView(
                title: "The Moon",
                subtitle: "Origin and general properties of the moon",
                page: Note(title: "The Moon", body: "7",),
              ),
              CustomListView(
                title: "Black Holes",
                subtitle: "A brief introduction to black holes",
                page: Note(title: "Black Holes", body: "8",),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget page;
  CustomListView({this.title, this.subtitle, this.page});
  CustomColor customColor = CustomColor();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: customColor.primary,
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(letterSpacing: 1.0, fontFamily: 'Montserrat'),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        enabled: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        isThreeLine: true,
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
