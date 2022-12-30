import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_extensions.dart';

class DotsIndicator extends StatelessWidget {
  final int index;
  final int count;

  const DotsIndicator({
    Key? key,
    required this.index,
    required this.count,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDotsRow(context));
  }

  List<Widget> _buildDotsRow(BuildContext context) {
    List<Widget> dots = []; // this will hold Rows according to available lines
    for (int i = 0; i < count; i++) {
      dots.add(Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 4,
          width: i == index ? 30 : 8,
          decoration: BoxDecoration(
            color: i == index ? context.primaryColor : Colors.grey,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(0.75)),
          ),
        ),
      ));
    }
    return dots;
  }
}
