import 'package:flutter/material.dart';
import 'package:movie_app/services/auth.dart';

import 'package:movie_app/model/movie.dart';

import 'package:movie_app/widget/horizontal_list_item.dart';
import 'package:movie_app/widget/vertical_list_item.dart';
import 'package:movie_app/screens/home/movie_details_screen.dart';
// import 'package:movie_app/widget/top_rated_list_item.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: Text('The Movie App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    textColor: Colors.white,
                    onPressed: () {
                      // fetchData();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data["movieList"].length,
                        itemBuilder: (context, i) =>
                            HorizontalListItem(i, snapshot.data["movieList"]),
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Best of 2020',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data["bestMovieList"].length,
                        itemBuilder: (context, i) =>
                            VerticalListItem(i, snapshot.data["bestMovieList"]),
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Top Rated Movies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data["topRatedMovieList"].length,
                        itemBuilder: (context, i) => HorizontalListItem(
                            i, snapshot.data["topRatedMovieList"]),
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchData extends SearchDelegate<String> {
  var movieLists = [
    'Avengers: Endgame',
    'Joker',
    'Mission Mangal',
    'It: Chapter Two',
    'Hobbs & Shaw',
    'The Lion King',
    'Inception',
  ];
  var recentMovies = [
    'The Dark Knight',
    'Interstellar',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Avengers: Endgame",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentMovies
        : movieLists.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
        ),
        onTap: () {
          showResults(context);
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
