import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/intro_list.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/extensions/build_context_extensions.dart';

class IntroFooter extends StatelessWidget {
  final int mSelectedPosition;

  final Function next;
  const IntroFooter(
      {Key? key, required this.mSelectedPosition, required this.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: mSelectedPosition == 0,
              child: TextButton(
                onPressed: () {
                  changeIntroStatus();
                  context.pushReplacementNamed(routName: app);
                },
                child: Text(
                  'Skip',
                  style: context.textTheme.headline3!,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: context.primaryColor),
              onPressed: () {
                changeIntroStatus();
                mSelectedPosition + 1 == IntroList.introData.length
                    ? context.pushReplacementNamed(routName: app)
                    : next();
              },
            )
          ],
        ),
      ),
    );
  }

  // used to save intro status
  void changeIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro_status', false);
  }
}
