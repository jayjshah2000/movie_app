import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/movie_details_screen.dart';

import 'package:movie_app/model/movie.dart';

class HorizontalListItem extends StatelessWidget {
  final int index;
  HorizontalListItem(this.index);

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
              'id': movieList[index].id,
              'title': movieList[index].title,
              'imageUrl': movieList[index].imageUrl,
              'description': movieList[index].description,
              'rating': movieList[index].rating,
              'year': movieList[index].year,
              'duration': movieList[index].duration,
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
                      image: NetworkImage(movieList[index].imageUrl),
                    ),
                  ),
                ),
              ),
            
            SizedBox(
              height: 10,
            ),
            Text(
              movieList[index].title,
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
