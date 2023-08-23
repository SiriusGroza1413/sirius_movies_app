import 'package:flutter/material.dart';
import 'package:sirius_movies_app/src/models/movie_model.dart';
import 'package:sirius_movies_app/src/providers/movies_provider.dart';


class DataSearch extends SearchDelegate {

  final peliculas = ['dqwd', 'qwdqw', 'frref', 'asdas'];
  final peliculasRecientes = ['sm', 'cp'];

  String seleccion = '';
  final moviesProvider = MoviesProvider();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Las acciones de nuestro appbar (limpar el texto de busqueda)
    return [
      IconButton(
        onPressed: () {
          query = '';
        }, 
        icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar (regresar al home)
    return IconButton( 
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
      onPressed: () {
        close(
          context,
          null
        );
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<MovieDetail>> snapshot) {

          if( snapshot.hasData ) {
            
            final movies = snapshot.data;

            return ListView(
              children: movies!.map( (movie) {
                  return ListTile(
                    leading: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: FadeInImage(
                        image: NetworkImage( movie.getPosterImg() ),
                        placeholder: AssetImage('assets/img/no-image.jpg'),
                        width: 50.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text( movie.title ),
                    subtitle: Text( movie.originalTitle ),
                    onTap: (){
                      close( context, null);
                      movie.uniqueId = '';
                      Navigator.pushNamed(context, 'detail', arguments: movie);
                    },
                  );
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );


  }
}