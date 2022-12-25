import 'package:flutter/material.dart';
import '../constants/route_constants.dart';
import '../../presentation/screens/app/app.dart';
import '../../presentation/screens/trending/trending.dart';
import '../../presentation/screens/intro/intro.dart';
import '../../presentation/screens/movie_details/movie_details.dart';
import '../../presentation/screens/movies/movies.dart';
import '../../presentation/screens/favorites/favorites.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case app:
        return MaterialPageRoute(builder: (_) => const App());
      case intro:
        return MaterialPageRoute(builder: (_) => const Intro());
      case movies:
        return MaterialPageRoute(builder: (_) => const Movies());
      case trending:
        return MaterialPageRoute(builder: (_) => const Trending());
      case favorites:
        return MaterialPageRoute(builder: (_) => const Favorites());
      case movieDetails:
        return MaterialPageRoute(
            builder: (_) => MovieDetails(
                  id: args as int,
                ));
      default:
        return null;
    }
  }
}
