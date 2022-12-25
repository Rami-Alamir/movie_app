import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_extensions.dart';

class BottomNavItem extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData icon;
  final bool isSelected;
  final bool empty;

  const BottomNavItem(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.isSelected,
      required this.icon,
      this.empty = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = empty
        ? Colors.transparent
        : isSelected
            ? context.colorScheme.primaryContainer
            : Colors.grey;
    return MaterialButton(
      minWidth: 40,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
            child: Icon(icon, size: 25, color: color),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
