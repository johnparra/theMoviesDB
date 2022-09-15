import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/src/pages/pages.dart';
import 'package:movies/src/services/movies_service.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavegacionModel(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('TheMoviesDB'),
            ),
            bottomNavigationBar: _navigation(),
            body: _pages()));
  }
}

class _navigation extends StatelessWidget {
  const _navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    final movService = Provider.of<MoviesService>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.actualPage,
        onTap: (i) => navegacionModel.actualPage = i,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Populares'),
          BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors_outlined), label: 'Recientes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_off_sharp), label: 'Perfil'),
        ]);
  }
}

class _pages extends StatelessWidget {
  const _pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [TabPopular(), TabRecents(), TabFavorites(), TabProfile()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _actualPage = 0;

  PageController _pageController = new PageController();

  int get actualPage => this._actualPage;

  set actualPage(int valor) {
    this._actualPage = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
