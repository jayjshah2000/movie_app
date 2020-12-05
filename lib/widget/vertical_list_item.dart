import 'package:flutter/material.dart';

import 'package:movie_app/screens/home/movie_details_screen.dart';

import 'package:movie_app/model/movie.dart';

class VerticalListItem extends StatelessWidget {
  final int index;
  final List bestMovieList;

  VerticalListItem(this.index,this.bestMovieList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MovieDetailsScreen.routeName,
              arguments: {
                'id': this.bestMovieList[index].id.toString(),
                'title': this.bestMovieList[index].title.toString(),
                'imageUrl': this.bestMovieList[index].imageUrl.toString(),
                'description': this.bestMovieList[index].description.toString(),
                'rating': this.bestMovieList[index].rating.toString(),
                'year': this.bestMovieList[index].year.toString(),
                'duration': this.bestMovieList[index].duration.toString(),
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          this.bestMovieList[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                
                Container(
                  padding: EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.bestMovieList[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          child: Container(
                          width: 240,
                          child: Text(this.bestMovieList[index].description,
                          overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
