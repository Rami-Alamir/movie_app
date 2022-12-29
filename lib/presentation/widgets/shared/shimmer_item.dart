import 'package:flutter/material.dart';

class ShimmerItem extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerItem({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
