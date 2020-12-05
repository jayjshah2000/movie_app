import 'package:flutter/material.dart';

import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screens/home/movie_details_screen.dart';

class TopRatedListItem extends StatelessWidget {
  final int index;
    final List topRatedMovieList;

  TopRatedListItem(this.index,this.topRatedMovieList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 160,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailsScreen.routeName,
            arguments: {
              'id': this.topRatedMovieList[index].id,
              'title': this.topRatedMovieList[index].title,
              'imageUrl': this.topRatedMovieList[index].imageUrl,
              'description': this.topRatedMovieList[index].description,
              'rating': this.topRatedMovieList[index].rating,
              'year': this.topRatedMovieList[index].year,
              'duration': this.topRatedMovieList[index].duration,
            },
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(this.topRatedMovieList[index].imageUrl),
                    ),
                  ),
                ),
              ),
            
            SizedBox(
              height: 10,
            ),
            Text(
              this.topRatedMovieList[index].title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
