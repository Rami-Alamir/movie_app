import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_extensions.dart';

class Retry extends StatelessWidget {
  final Function onPressed;

  const Retry({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          Icons.refresh,
          size: 30,
          color: context.primaryColor,
        ),
      ),
    );
  }
}
