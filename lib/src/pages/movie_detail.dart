import 'package:flutter/material.dart';

import 'package:sirius_movies_app/src/models/movie_model.dart';
import 'package:sirius_movies_app/src/providers/movies_provider.dart';


class MovieDetailPage extends StatelessWidget {


  @override build(BuildContext context) {

    final MovieDetail movie = ModalRoute.of(context)!.settings.arguments! as MovieDetail;


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _createAppBar( movie ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 760,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _posterTitle(movie, context),
                      _description(movie, context)
                    ]
                  )
                ),
              ]
            ),
          )
        ],
      ),
      );
  }
  


  _createAppBar(MovieDetail movie) {
    
    return SliverAppBar(
      elevation: 4.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 300.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(13.0),
        title: Text(
          movie.title, 
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 19.0,
            shadows: [
              BoxShadow(
                blurRadius: 10.0,
              )
            ]
          ),
        ),
        expandedTitleScale: 1.0,
        background: FadeInImage(
          placeholder: AssetImage('assets/gif/loading.gif'), 
          image: NetworkImage(movie.getBackgroundImg()),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 200),
          
        ),
      ),
    );
  }

  
  _posterTitle(MovieDetail movie, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(movie.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Column(
              children: [
                // Text(movie.title, 
                //   style: Theme.of(context).textTheme.headlineSmall,
                //   overflow: TextOverflow.ellipsis,
                // ),
                Text(movie.originalTitle, 
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.star_border),
                  Text(movie.voteAverage.toString())
                  ],
                )
              ],
            )
          )

        ],
      ),
    );
  }


  
  _description(MovieDetail movie, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Fecha de estreno: ${movie.releaseDate}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text('Solo para adultos: ${movie.adult ? "Si" : "No"}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 20.0,
          ),
          _overview(movie.overview, context),
        ],
      )
    );
  }
  
  _overview(String overview, BuildContext context) {
    return Container(
      child: Text(overview,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyMedium,
      )
    );
  }


}