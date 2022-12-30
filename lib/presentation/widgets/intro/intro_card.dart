import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/constants/intro_list.dart';
import '../../../core/utils/size_config.dart';

class IntroCard extends StatelessWidget {
  final int mSelectedPosition;

  const IntroCard({Key? key, required this.mSelectedPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: SizeConfig.setWidgetWidthWithFactor(0.7, 0.4, 0.3),
              child: Lottie.asset(
                IntroList.introData[mSelectedPosition].image,
                width: SizeConfig.setWidgetWidthWithFactor(1, .5, .5),
                height: SizeConfig.setWidgetHeightWithFactor(0.5, 0.49, 0.49),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
                width: SizeConfig.setWidgetWidthWithFactor(0.8, 0.8, 0.8),
                child: Text(
                  IntroList.introData[mSelectedPosition].title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline4!.copyWith(
                    height: 1.40,
                  ),
                )),
            Container(
                width: SizeConfig.setWidgetWidthWithFactor(0.52, 0.52, 0.52),
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  IntroList.introData[mSelectedPosition].subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline6!.copyWith(
                    height: 1.40,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
