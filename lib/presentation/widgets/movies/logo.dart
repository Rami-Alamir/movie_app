import 'package:flutter/material.dart';
import '../../../core/constants/fixed_assets.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      FixedAssets.logo,
      width: 135,
      height: 80,
      fit: BoxFit.scaleDown,
    );
  }
}
