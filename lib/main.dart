import 'package:flutter/material.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OYO LAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.themeData,
      initialRoute: Routes.splashRoute,
      getPages: Routes.gobalRoutes,
      //routes: Routes.gobalRoutes,
      // home: const HomePage(),
    );
  }
}
