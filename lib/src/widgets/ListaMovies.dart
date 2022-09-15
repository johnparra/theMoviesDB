import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/theme/theme.dart';

class ListaMovies extends StatelessWidget {
  final List<Result> movies;

  const ListaMovies(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (BuildContext context, int index) {
        return _Movie(movie: this.movies[index], index: index);
      },
    );
  }
}

class _Movie extends StatelessWidget {
  final Result movie;
  final int index;

  const _Movie({
    required this.movie,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CardTopBar(movie: movie, index: index),
      _CardImage(movie: movie)
    ]);
  }
}

class _CardTopBar extends StatelessWidget {
  final Result movie;
  final int index;

  const _CardTopBar({
    required this.movie,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text(
          '${index + 1}.',
          style: TextStyle(color: myTheme.accentColor),
        ),
        Text('${movie.name}.')
      ]),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Result movie;

  const _CardImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    final _URL_IMG = 'https://image.tmdb.org/t/p/w500/';
    return Container(
        child: FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage('$_URL_IMG${movie.backdropPath}')));
    // image: AssetImage('assets/img/giphy.gif')));
  }
}
