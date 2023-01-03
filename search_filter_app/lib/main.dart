import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:thanawat_filter/page/home_page.dart';
import 'package:thanawat_filter/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Thanawat Filter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Playfair Display',
      ),
      home: HomePage(),
      getPages: Routes.routes,
      // initialRoute: Routes.initialPage,
    );
  }
}
