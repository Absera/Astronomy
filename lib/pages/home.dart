import 'package:flutter/material.dart';
import 'list_view.dart';
import 'about_page.dart';
import 'color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  static List<Widget> _pages = <Widget>[
    ListViewTopic(),
    AboutPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomColor customColor = CustomColor();

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 8,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "ASTRONOMY",
                  style: TextStyle(
                      color: Colors.grey[700],
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat'),
                ),
                background: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "Assets/image_sliver.png",
                      ),
                    ),
                    //  border: Border.all(),
                    //  borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
            )
          ];
        },
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: customColor.primary),
        selectedLabelStyle: TextStyle(color: customColor.primary),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text(
              'Learn',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text(
              'Info',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: customColor.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
