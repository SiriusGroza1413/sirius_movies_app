import 'package:flutter/material.dart';
import 'package:sirius_movies_app/src/models/movie_model.dart';


class MovieHorizontal extends StatelessWidget {
  
  final List<MovieDetail> movies;

  MovieHorizontal({required this.movies});


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: _screenSize.height * 0.22,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _cards(context),
      ),
    );
  }
  

  List<Widget> _cards(context) {

    return movies.map( ( movie ) {

      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterImg()),
                placeholder: AssetImage('assets/gif/loading.gif'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            // SizedBox(
            //   height: 3.0,
            // ),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall
            )
          ],
        ),
      );
    }).toList();

  }
}