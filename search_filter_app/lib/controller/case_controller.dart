import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:thanawat_filter/models/case_model.dart';

class CaseController extends GetxController {
  var items = <CaseIphone>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var itemResult = [
      CaseIphone(
          id: 1,
          image: 'assets/images/case_images/A1.jpg',
          title: 'Karat A Touch of Pearl',
          brand: 'Case-Mate',
          color: 'Pearl ',
          price: 2190,
          version: 'IPhone 14'),
      CaseIphone(
          id: 2,
          image: 'assets/images/case_images/A1.jpg',
          title: '2',
          brand: '2',
          color: '2 ',
          price: 2190,
          version: 'IPhone 14'),
      CaseIphone(
          id: 3,
          image: 'assets/images/case_images/A1.jpg',
          title: '3',
          brand: '3',
          color: '3 ',
          price: 2190,
          version: 'IPhone 14'),
      CaseIphone(
          id: 4,
          image: 'assets/images/case_images/A1.jpg',
          title: '4',
          brand: '4',
          color: '4 ',
          price: 2190,
          version: 'IPhone 14'),
      CaseIphone(
          id: 5,
          image: 'assets/images/case_images/A1.jpg',
          title: '5',
          brand: '5',
          color: '5 ',
          price: 2190,
          version: 'IPhone 14'),
      CaseIphone(
          id: 6,
          image: 'assets/images/case_images/A1.jpg',
          title: '6',
          brand: '6',
          color: '6 ',
          price: 2190,
          version: 'IPhone 14'),
      CaseIphone(
          id: 7,
          image: 'assets/images/case_images/A1.jpg',
          title: '7',
          brand: '7',
          color: '7 ',
          price: 2190,
          version: 'IPhone 14'),
    ];

    items.assignAll(itemResult);
  }
}
