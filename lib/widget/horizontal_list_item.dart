import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/movie_details_screen.dart';

import 'package:movie_app/model/movie.dart';

class HorizontalListItem extends StatelessWidget {
  final int index;
  final List movieList;
  HorizontalListItem(this.index, this.movieList);

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
              'id': this.movieList[index].id.toString(),
              'title': this.movieList[index].title.toString(),
              'imageUrl': this.movieList[index].imageUrl.toString(),
              'description': this.movieList[index].description.toString(),
              'rating': this.movieList[index].rating.toString(),
              'year': this.movieList[index].year.toString(),
              'duration': this.movieList[index].duration.toString(),
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
                    image: NetworkImage(this.movieList[index].imageUrl),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.movieList[index].title,
              style: TextStyle(
                fontSize: 12,
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
