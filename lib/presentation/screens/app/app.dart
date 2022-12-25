import 'package:flutter/material.dart';
import '../../widgets/bottom_nav/bottom_nav_item.dart';
import '../../widgets/bottom_nav/trending_button.dart';
import '../../../presentation/screens/movies/movies.dart';
import '../../../presentation/screens/favorites/favorites.dart';
import '../../../core/service/service_locator.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/movie_icons_icons.dart';
import '../../../core/utils/size_config.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const Movies(),
    const Favorites(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sl<SizeConfig>().init(context);

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: currentTab,
            children: screens.map((e) => e).toList(),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () => context.pushNamed(routName: trending),
        child: const TrendingButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: context.colorScheme.primary,
        elevation: 15,
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Left Tab bar icons
              BottomNavItem(
                  icon: MovieIcons.movies,
                  label: "Movies",
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  isSelected: currentTab == 0),
              BottomNavItem(
                  label: "",
                  icon: MovieIcons.movies,
                  empty: true,
                  onPressed: () {},
                  isSelected: currentTab == 3),
              // Right Tab bar icons
              BottomNavItem(
                  label: "Favorites",
                  icon: MovieIcons.favourites,
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  isSelected: currentTab == 1),
            ],
          ),
        ),
      ),
    );
  }
}
