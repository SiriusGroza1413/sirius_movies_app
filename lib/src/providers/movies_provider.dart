import 'dart:async';
import 'dart:convert';
import 'package:sirius_movies_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;


//CLASE QUE SE ENCARGA DE CONECTASE A LA API DE TMDB
class MoviesProvider {

  String _apiKey = '018f9406bac3a7ddd16d9cbfd33426b2';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MX';


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

    _popularesPage++;

    final url = Uri.http(_url, '/3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });


    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;
  }
}


//final moviesprovider = MoviesProvider();