import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../shared/shimmer_item.dart';
import '../../../../core/enum/device_screen_type.dart';
import '../../../../core/utils/size_config.dart';

class NowPlayingSliderShimmer extends StatelessWidget {
  const NowPlayingSliderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          height: SizeConfig.setWidgetHeight(430, 540, 540),
          viewportFraction:
              SizeConfig.deviceScreenType == DeviceScreenType.mobile
                  ? 0.7
                  : 0.5,
          enlargeFactor: 0.2,
          enlargeCenterPage: true),
      items: [
        Column(
          children: [
            ShimmerItem(
              width: SizeConfig.setWidgetWidth(250, 400, 400),
              height: SizeConfig.setWidgetHeight(380, 500, 500),
            )
          ],
        )
      ],
    );
  }
}
