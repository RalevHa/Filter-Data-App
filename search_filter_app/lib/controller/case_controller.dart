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
    super.onInit();
    getData();
    getKeyword = '';
  }

  getData() async {
    items.bindStream(FirestoreDB().getCaseProduct());
    displaylist = items;
  }

  int selectBrands = 0;
  int selectColor = 0;
  int selectVersion = 0;
  late String getKeyword;

  onSelectCate(String keyword) {
    if (keyword.trim().isEmpty) {
      if (selectBrands == 0 && selectColor == 0 && selectVersion == 0) {
        displaylist = items;
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 0) {
        displaylist = items
            .where((element) => (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 0) {
        displaylist = items
            .where((element) => (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 0) {
        displaylist =
            items.where((element) => (element.brand).contains('UAG')).toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 0) {
        displaylist =
            items.where((element) => (element.color).contains('Pink')).toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) => (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) => (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.color).contains('Pink'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.color).contains('Pink'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('Pink'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) => (element.version).endsWith('iPhone 14'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) => (element.version).endsWith('iPhone 14 Pro'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) => (element.version).endsWith('iPhone 14 Pro Max'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Coach'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      }
    } else {
      if (selectBrands == 0 && selectColor == 0 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Case-Mate') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Coach') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Pink') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Coach') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 2 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('White') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      }
    }
  }

  // updateList(String keyword) {
  //   displaylist = items
  //       .where((element) =>
  //           (element.title).toLowerCase().contains(keyword.toLowerCase()))
  //       .toList();
  // }
}
