import 'package:get/get.dart';
import 'package:thanawat_filter/page/home_page.dart';

class Routes {
  static String initialPage = '/home';
  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomePage()),
  ];
}