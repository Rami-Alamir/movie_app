import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'now_playing_card.dart';
import '../../../controllers/movies_provider.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/enum/device_screen_type.dart';

class NowPlayingSlider extends StatelessWidget {
  const NowPlayingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);

    return CarouselSlider(
      options: CarouselOptions(
          height: SizeConfig.setWidgetHeight(566, 670, 670),
          viewportFraction:
              SizeConfig.deviceScreenType == DeviceScreenType.mobile
                  ? 0.7
                  : 0.5,
          enlargeFactor: 0.2,
          enlargeCenterPage: true),
      items: moviesProvider.nowPlaying.movie!.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return NowPlayingCard(movie: item);
          },
        );
      }).toList(),
    );
  }
}
