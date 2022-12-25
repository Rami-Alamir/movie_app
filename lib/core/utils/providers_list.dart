import 'package:provider/provider.dart';
import '../../controllers/favorites_provider.dart';
import '../../controllers/movie_details_provider.dart';
import '../../controllers/movies_provider.dart';
import '../../controllers/trending_provider.dart';

class ProvidersList {
  ProvidersList._();
  static providersList() {
    return [
      ChangeNotifierProvider<MoviesProvider>(
          create: (context) => MoviesProvider()),
      ChangeNotifierProvider<TrendingProvider>(
          create: (context) => TrendingProvider()),
      ChangeNotifierProvider<FavoritesProvider>(
          create: (context) => FavoritesProvider()),
      ChangeNotifierProvider<MovieDetailsProvider>(
          create: (context) => MovieDetailsProvider()),
    ];
  }
}
