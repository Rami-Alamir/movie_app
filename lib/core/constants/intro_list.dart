import '../../models/intro_data.dart';

class IntroList {
  IntroList._();
  static List<IntroData> introData = [
    IntroData('assets/lottie/movies.json', 'Discover Movies',
        'Discover the upcoming movies, now playing movies and all movies based on the category.'),
    IntroData('assets/lottie/trending2.json', 'Trending movies',
        'Discover list of trending movies with rate.'),
    IntroData('assets/lottie/favorite.json', 'Favorites movies',
        'You can add/remove a movie to/from the favorites list.'),
  ];
}
