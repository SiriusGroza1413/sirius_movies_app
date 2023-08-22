import 'package:flutter/material.dart';


class DataSearch extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Las acciones de nuestro appbar (limpar el texto de busqueda)
    return [
      IconButton(
        onPressed: () {
          print('click');
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
        print('Leading Icon Press');
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TSugerencias que aparecen cuando el user escribe
    return Container();
  }

}