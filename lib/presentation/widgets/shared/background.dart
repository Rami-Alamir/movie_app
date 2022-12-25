import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_extensions.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1, 0.3, 0.5, 0.9],
            colors: [
              context.colorScheme.secondary,
              context.colorScheme.secondaryContainer,
              context.colorScheme.primary,
              context.colorScheme.primary
            ],
          ),
        ),
        child: child);
  }
}
