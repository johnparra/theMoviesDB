import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:http/http.dart' as http;

final _URL_MOVIES = 'https://api.themoviedb.org/3';
final _APIKEY = 'b0139b80db253f706e5da6f3f3828f5a';

class MoviesService with ChangeNotifier {
  List<Result> movieline = [];

  MoviesService() {
    this.getCompanyLine();
  }

  getCompanyLine() async {
    final url =
        '$_URL_MOVIES/tv/popular?api_key=$_APIKEY&language=en-US&page=1';
    final resp = await http.get(Uri.parse(url));

    final moviesResponse = moviesResponseFromJson(resp.body);
    this.movieline.addAll(moviesResponse.results);
    notifyListeners();
  }
}
