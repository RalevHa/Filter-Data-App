import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:thanawat_filter/firebase/firebasefirestore.dart';
import 'package:thanawat_filter/models/case_model.dart';

class CaseController extends GetxController {
  var items = <CaseIphone>[].obs;
  TextEditingController searchController = TextEditingController();
  var displaylist = <CaseIphone>[];

  @override
  onInit() {
    // fetchProducts();
    items.bindStream(FirestoreDB().getCaseProduct());
    displaylist = items;
    super.onInit();
  }

  bool select = false;
  int selectCategory = 0;

  onCategories() {
    switch (selectCategory) {
      case 0:
        {
          displaylist = items;
        }
        break;
      case 1:
        {
          displaylist = items
              .where((element) => (element.brand).contains('Case-Mate'))
              .toList();
        }
        break;
      case 2:
        {
          displaylist = items
              .where((element) => (element.brand).contains('Coach'))
              .toList();
        }
        break;
      case 3:
        {
          displaylist = items
              .where((element) => (element.brand).contains('UAG'))
              .toList();
        }
        break;
      default:
    }
  }

  int selectColor = 0;

  onColor() {
    switch (selectColor) {
      case 0:
        {
          displaylist = items;
        }
        break;
      case 1:
        {
          displaylist = items
              .where((element) => (element.color).contains('Pink'))
              .toList();
        }
        break;
      case 2:
        {
          displaylist = items
              .where((element) => (element.color).contains('White'))
              .toList();
        }
        break;
      case 3:
        {
          displaylist = items
              .where((element) => (element.color).contains('Black'))
              .toList();
        }
        break;
      default:
    }
  }

  updateList(String keyword) {
    displaylist = items
        .where((element) =>
            (element.title).toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

//   void fetchProducts() async {
//     await Future.delayed(const Duration(seconds: 1));
//     var itemResult = [
//       CaseIphone(
//           id: 1,
//           image: 'assets/images/case_images/A1.jpg',
//           title: 'Karat A Touch of Pearl',
//           brand: 'Case-Mate',
//           color: 'Pearl ',
//           price: 2190,
//           version: 'iPhone 14'),
//       CaseIphone(
//           id: 2,
//           image: 'assets/images/case_images/A2.jpg',
//           title: 'Punk Rose Pink',
//           brand: 'Coach',
//           color: 'Rose Pink ',
//           price: 1690,
//           version: 'iPhone 14 Pro Max'),
//       CaseIphone(
//           id: 3,
//           image: 'assets/images/case_images/A1.jpg',
//           title: '3',
//           brand: '3',
//           color: '3 ',
//           price: 2190,
//           version: 'IPhone 14'),
//       CaseIphone(
//           id: 4,
//           image: 'assets/images/case_images/A1.jpg',
//           title: '4',
//           brand: '4',
//           color: '4 ',
//           price: 2190,
//           version: 'IPhone 14'),
//       CaseIphone(
//           id: 5,
//           image: 'assets/images/case_images/A1.jpg',
//           title: '5',
//           brand: '5',
//           color: '5 ',
//           price: 2190,
//           version: 'IPhone 14'),
//       CaseIphone(
//           id: 6,
//           image: 'assets/images/case_images/A1.jpg',
//           title: '6',
//           brand: '6',
//           color: '6 ',
//           price: 2190,
//           version: 'IPhone 14'),
//       CaseIphone(
//           id: 7,
//           image: 'assets/images/case_images/A1.jpg',
//           title: '7',
//           brand: '7',
//           color: '7 ',
//           price: 2190,
//           version: 'IPhone 14'),
//     ];
//     items.assignAll(itemResult);
//   }
}
