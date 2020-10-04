import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:genius_demo/features/github/presentation/pages/github_screen.dart';
import 'package:genius_demo/features/movies/pages/restaurant_screen.dart';
import 'package:genius_demo/features/movies/presentation/pages/movies_screen.dart';
import 'package:genius_demo/features/news/presentation/pages/news_screen.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  final _tabs = [
    NewsScreen(),
    MoviesScreen(),
    RestaurantScreen(),
    GithubScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(
                  FontAwesome.newspaper_o,
                ),
              ),
              title: Text(
                "News",
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(
                  MaterialCommunityIcons.video,
                ),
              ),
              title: Text(
                "Movies",
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(
                  MaterialIcons.restaurant,
                ),
              ),
              title: Text(
                "Restaurants",
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(AntDesign.github),
              ),
              title: Text(
                "Github",
              )),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
