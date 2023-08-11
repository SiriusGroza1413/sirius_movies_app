import 'package:flutter/material.dart';

import 'package:sirius_movies_app/src/providers/movies_provider.dart';
import 'package:sirius_movies_app/src/widgets/card_swiper_widget.dart';

import '../models/movie_model.dart';


class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
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
          children: [
            _swiperTarjetas(),
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
}

