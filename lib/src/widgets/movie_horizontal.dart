import 'package:flutter/material.dart';
import 'package:sirius_movies_app/src/models/movie_model.dart';


class MovieHorizontal extends StatelessWidget {
  
  final List<MovieDetail> movies;
  final Function siguientePagina;


  MovieHorizontal({required this.movies, required this.siguientePagina});


  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );


  @override
  Widget build(BuildContext context) {


    final _screenSize = MediaQuery.of(context).size;


    _pageController.addListener( () {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    
    return Container(
      height: _screenSize.height * 0.22,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, i) => _card(context, movies[i]) ,
      ),
    );
  }


  Widget _card(BuildContext context, MovieDetail movie){
    final card = Container(
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

      return GestureDetector(
        child: card,
        onTap: (){
          print('id: ${movie.title}');
        },
      );
  }
  

  // List<Widget> _cards(context) {

  //   return movies.map( ( movie ) {

  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(20.0),
  //             child: FadeInImage(
  //               image: NetworkImage(movie.getPosterImg()),
  //               placeholder: AssetImage('assets/gif/loading.gif'),
  //               fit: BoxFit.cover,
  //               height: 160.0,
  //             ),
  //           ),
  //           // SizedBox(
  //           //   height: 3.0,
  //           // ),
  //           Text(
  //             movie.title,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.bodySmall
  //           )
  //         ],
  //       ),
  //     );
  //   }).toList();

  // }
}