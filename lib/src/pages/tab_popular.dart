import 'package:flutter/material.dart';
import 'package:movies/src/services/movies_service.dart';
import 'package:movies/src/widgets/ListaMovies.dart';
import 'package:provider/provider.dart';

class TabPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesService = Provider.of<MoviesService>(context);
    return Scaffold(
      body: ListaMovies(moviesService.movieline),
    );
  }
}
