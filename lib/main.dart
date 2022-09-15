import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/pages/tabs.dart';
import 'package:movies/src/services/movies_service.dart';
import 'package:movies/src/theme/theme.dart';
import 'package:provider/provider.dart';

//Populares, recientes, favoritas, perfil

/**
 * Imagenes
//  Base URL: https://image.tmdb.org/t/p/
// Tamaño: Aquí puede agregar el tamaño que considere necesario, los valores permitidos son
// w100, w200, w300, w400, w500 y original
// Imagen: Aquí se toma el valor que viene en el response en poster_path, backdrop_path o
// cualquier valor que contenga la url de una imagen.
// Al final debemos tener algo como:
// https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg

// API
// Base URL: https://api.themoviedb.org/3
// Metodo GET
// Get Popular: /tv/popular?api_key=<<api_key>>&language=en-US&page=1
 * 
 * karol.contreras@imagineapps.co
 */

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new MoviesService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'The Movies DB',
          theme: myTheme,
          home: Tabs()),
    );
  }
}
