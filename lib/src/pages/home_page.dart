import 'package:flutter/material.dart';

import 'package:sirius_movies_app/src/providers/movies_provider.dart';
import 'package:sirius_movies_app/src/widgets/card_swiper_widget.dart';
import 'package:sirius_movies_app/src/widgets/movie_horizontal.dart';

import '../models/movie_model.dart';


class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final _textTheme = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      appBar: AppBar(
        title: Text("Guillermito's Movies App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search)
            )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _swiperTarjetas(),
            _footer(_textTheme),
          ]
        ),
      ),
    );
  }
  
  Widget _swiperTarjetas() {

    return FutureBuilder(
      
      future: moviesprovider.getInTheaters(),
      builder: (BuildContext context, AsyncSnapshot<List<MovieDetail>> snapshot){

        if ( snapshot.hasData ) {
            return CardSwiper(movies: snapshot.data! );
          } else {
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator()
              )
            );
          }
      }
    );
  }
  
  _footer(_textTheme) {

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', 
              style: _textTheme,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          FutureBuilder(
            future: moviesprovider.getPopulars(),
            builder: (BuildContext context, AsyncSnapshot<List<MovieDetail>> snapshot) {
              
              if(snapshot.hasData){
                return MovieHorizontal(movies: snapshot.data!);
              } else {
                return CircularProgressIndicator();
              }    
            }
          ),
        ],
      )
    );
  }
}

