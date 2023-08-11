import 'dart:convert';
import 'package:sirius_movies_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;


//CLASE QUE SE ENCARGA DE CONECTASE A LA API DE TMDB
class MoviesProvider {

  String _apiKey = '018f9406bac3a7ddd16d9cbfd33426b2';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MX';


  Future<List<MovieDetail>> getInTheaters() async {

    final url = Uri.http(_url, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Movies.fromJsonList(decodedData['results']); //1) llama al "constructor" de la clase Movie pasandole el json devuelto por el get

    
    return peliculas.items;
  }
}

final moviesprovider = MoviesProvider();