import 'package:flutter/material.dart';
import '../../widgets/shared/background.dart';
import '../../widgets/shared/primary_app_bar.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PrimaryAppBar(
        title: 'Favorites',
      ),
      body: Background(
        child: Center(),
      ),
    );
  }
}
