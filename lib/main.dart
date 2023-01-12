import 'package:flutter/material.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/app_string.dart';
import 'package:movie/layout/main_layout/screen/layout_screen.dart';
import 'package:movie/layout/movies/presentation/screens/Movies_screen/movies_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:  const Color(0xff303030)
      ),
      home: const MainLayoutScreen(),
    );
  }
}
