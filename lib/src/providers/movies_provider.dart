import 'dart:async';
import 'dart:convert';
import 'package:sirius_movies_app/src/models/actors_model.dart';
import 'package:sirius_movies_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;


//CLASE QUE SE ENCARGA DE CONECTASE A LA API DE TMDB
class MoviesProvider {

  String _apiKey = '018f9406bac3a7ddd16d9cbfd33426b2';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MX';

  bool _loading = false;
  int _popularesPage = 0;
  List<MovieDetail> _populares = [];


  final _popularesStreamController = StreamController<List<MovieDetail>>.broadcast();


  Function(List<MovieDetail>) get popularesSink => _popularesStreamController.sink.add;
  Stream<List<MovieDetail>> get popularesStream => _popularesStreamController.stream;


  void disposeStreams(){
    _popularesStreamController.close();
  }



  Future<List<MovieDetail>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final populars = Movies.fromJsonList(decodedData['results']); 

    return populars.items;
  }



  Future<List<MovieDetail>> getInTheaters() async {
    final url = Uri.http(_url, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language
    });
    return await _procesarRespuesta(url);
  }



  Future<List<MovieDetail>> getPopulares() async {

    if( _loading ) return [];
    _loading = true;

    _popularesPage++;


    print('cargando siguientes');

    final url = Uri.http(_url, '/3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });


    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    _loading = false;
    return resp;
  }



  Future<List<Actors>> getCast(String movieId) async {
    final url = Uri.http(_url, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
      'language': 'es-MX'
    });

    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    final cast = Actors.fromJsonList(decodedData['cast']);

    return cast.actors;
  }
  
}


//final moviesprovider = MoviesProvider();