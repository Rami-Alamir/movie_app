import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/utils/size_config.dart';

class MovieImage extends StatelessWidget {
  final String imagePath;
  final Animation<Offset> animationOffset;

  const MovieImage(
      {Key? key, required this.imagePath, required this.animationOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationOffset,
      child: FadeInImage.assetNetwork(
          image: Constants.imagesPath + imagePath,
          fit: BoxFit.fill,
          placeholder: FixedAssets.placeHolder,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! / 1.8),
    );
  }
}
