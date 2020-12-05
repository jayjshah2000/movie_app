import 'package:flutter/material.dart';
import 'package:movie_app/services/auth.dart';

import 'package:movie_app/model/movie.dart';

import 'package:movie_app/widget/horizontal_list_item.dart';
import 'package:movie_app/widget/vertical_list_item.dart';
import 'package:movie_app/widget/top_rated_list_item.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: Text('Movies App'),
        actions: <Widget>[
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
                    onPressed: () {
                      // fetchData();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, i) => HorizontalListItem(i),
              ),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: bestMovieList.length,
                itemBuilder: (context, i) => VerticalListItem(i),
              ),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedMovieList.length,
                itemBuilder: (context, i) => TopRatedListItem(i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
