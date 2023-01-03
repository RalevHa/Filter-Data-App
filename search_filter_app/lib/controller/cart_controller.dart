import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:thanawat_filter/models/case_model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CaseIphone>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get count => cartItems.length;

  addToCard(CaseIphone caseIphone) {
    cartItems.add(caseIphone);
  }
}
