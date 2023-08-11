import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:sirius_movies_app/src/models/movie_model.dart';


class CardSwiper extends StatelessWidget {
  
  final List<MovieDetail> movies;
  
  CardSwiper({ required this.movies });

  
  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    return Container(
       padding: EdgeInsets.only(top: 10.0),
       child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int index){

            movies[index].uniqueId = '${movies[index].id }-tarjeta';

            // return Hero(
            //   tag: movies[index].uniqueId,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20.0),
            //     child: GestureDetector(
            //       onTap: () => {} /*Navigator.pushNamed(context, 'detalle', arguments: movies[index])*/,
            //       child: FadeInImage(
            //         image: NetworkImage(movies[index].getPosterImg()),
            //         placeholder: AssetImage('assets/img/no-image.jpg'),
            //         fit: BoxFit.cover,
            //       ),
            //     )
            //   ),
            // );

            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => {} /*Navigator.pushNamed(context, 'detalle', arguments: movies[index])*/,
                  child: FadeInImage(
                    image: NetworkImage(movies[index].getPosterImg()),
                    placeholder: AssetImage('assets/gif/loading.gif'),
                    fit: BoxFit.cover,
                  ),
                )
                
              );
            
          },
          itemCount: movies.length,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
      ),
    );

  }
}