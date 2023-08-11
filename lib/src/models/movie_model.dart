
// FIJARSE Y ESTUDIARSE BIEN EL COMPORTAMIENTO DE ESTAS CLASES JUNTO CON EL PROVIDER, ES MUY IMPORTANSE
// SABERSE EL FLUJO


//CLASE QUE REPRESENTA MI COLECCION DE PELICULAS LLAMADAS DESDE LA API
class Movies {

  List<MovieDetail> items = []; //2) inicializo una lista donde guardare mis movies que enviare a dibujar en pantalla
  Movies();

  Movies.fromJsonList(List<dynamic> jsonList  ) {
    for ( var item in jsonList  ) { //3) recorro el json para crear ua nueva intancia de MovieDetail con su metodo fromJsonMap
      final pelicula = MovieDetail.fromJsonMap(item);
      items.add( pelicula ); //4) agrego cada objeto instanciado de MovieDetail a la lista Items que se usara para reenderizar los widgets
    }
  }
}

// CLASE QUE REPRESENTA UNA PELICULA EN ESPECIFICO (CADA INSTANCIA DE ESTA CLASE SE GUARDARA EN LA CLASE MOVIES)
class MovieDetail {
  late int voteCount;
  late int id;
  late bool video;
  late double voteAverage;
  late String title;
  late double popularity;
  late String posterPath;
  late String originalLanguage;
  late String originalTitle;
  late List<int> genreIds;
  late String backdropPath;
  late bool adult;
  late String overview;
  late String releaseDate;
  late String uniqueId;

  MovieDetail({
    required this.voteCount,
    required this.id,
    required this.video,
    required this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    //required this.uniqueId
  });

  MovieDetail.fromJsonMap( Map<String, dynamic> json ) {

    voteCount        = json['vote_count'];
    id               = json['id'];
    video            = json['video'];
    voteAverage      = json['vote_average'] / 1;
    title            = json['title'];
    popularity       = json['popularity'] / 1;
    posterPath       = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle    = json['original_title'];
    genreIds         = json['genre_ids'].cast<int>();
    backdropPath     = json['backdrop_path'];
    adult            = json['adult'];
    overview         = json['overview'];
    releaseDate      = json['release_date'];
    //uniqueId         = json['id'].toString();
  }

  getPosterImg() {

    if ( posterPath == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

   getBackgroundImg() {

    if ( posterPath == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }

}
