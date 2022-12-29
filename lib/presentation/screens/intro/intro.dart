import 'package:flutter/material.dart';
import '../../widgets/intro/dots_indicator.dart';
import '../../widgets/intro/intro_card.dart';
import '../../widgets/intro/intro_footer.dart';
import '../../../core/constants/intro_list.dart';
import '../../../core/enum/device_screen_type.dart';
import '../../../core/service/service_locator.dart';
import '../../../core/utils/size_config.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<Intro> {
  int mSelectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    sl<SizeConfig>().init(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.deviceScreenType == DeviceScreenType.desktop
                    ? 80.0
                    : 0.0),
            child: PageView.builder(
              controller: PageController(
                  initialPage: mSelectedPosition,
                  keepPage: true,
                  viewportFraction: 1),
              itemCount: IntroList.introData.length,
              onPageChanged: (index) {
                setState(() {
                  mSelectedPosition = index;
                });
              },
              itemBuilder: (context, i) {
                return IntroCard(mSelectedPosition: mSelectedPosition);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: DotsIndicator(
            index: mSelectedPosition,
            count: IntroList.introData.length,
          ),
        ),
        IntroFooter(
            mSelectedPosition: mSelectedPosition,
            next: () {
              setState(() {
                mSelectedPosition = mSelectedPosition + 1;
              });
            })
      ],
    ));
  }
}
