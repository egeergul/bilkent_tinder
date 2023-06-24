import 'package:bilkent_tinder/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bilkent Tinder',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
       theme: ThemeData(
         primarySwatch: Colors.pink
      ),
      getPages: AppRoutes.routes
    );
  }
}