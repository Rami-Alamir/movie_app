import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/utils/route_generator.dart';
import '../../../core/utils/app_theme.dart';

//App Widget tree
class MyApp extends StatelessWidget {
  final bool introStatus;
  const MyApp({Key? key, required this.introStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.theme,
      initialRoute: introStatus ? intro : app,
    );
  }
}
