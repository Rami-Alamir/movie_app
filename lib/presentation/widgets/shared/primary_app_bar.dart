import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_extensions.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool back;
  final String? title;
  final Widget? child;
  final List<Widget>? action;
  const PrimaryAppBar(
      {Key? key, this.back = false, this.title, this.child, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: title != null
            ? Text(
                title!,
                style: context.textTheme.headline4,
              )
            : child,
        centerTitle: true,
        leading: Visibility(
          visible: back,
          child: SizedBox(
            width: 55,
            height: 66,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(Icons.arrow_back_ios, color: context.primaryColor),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        actions: action,
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
