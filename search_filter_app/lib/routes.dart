import 'package:get/get.dart';
import 'package:thanawat_filter/page/add_page.dart';
import 'package:thanawat_filter/page/filter_page.dart';
import 'package:thanawat_filter/page/home_page.dart';

class Routes {
  static String initialPage = '/home';
  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/filter', page: () => FilterPage()),
    GetPage(name: '/add', page: () => AddPage()),
  ];
}
