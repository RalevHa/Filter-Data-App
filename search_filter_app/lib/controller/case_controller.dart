import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanawat_filter/firebase/firebasefirestore.dart';
import 'package:thanawat_filter/models/case_model.dart';

class CaseController extends GetxController {
  var items = <CaseIphone>[].obs;
  var displaylist = <CaseIphone>[];
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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

  File? imageBlank;
  File? image;
  String? pathImageStore;
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
            .where((element) => (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 0 && selectVersion == 0) {
        displaylist =
            items.where((element) => (element.brand).contains('UAG')).toList();
        items.refresh();
      } else if (selectBrands == 0 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) => (element.color).contains('Colorful'))
            .toList();
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
                (element.color).contains('Colorful'))
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
                (element.brand).contains('Otterbox') &&
                (element.color).contains('Colorful'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Otterbox') &&
                (element.color).contains('White'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Otterbox') &&
                (element.color).contains('Black'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('Colorful'))
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
                (element.brand).contains('Otterbox'))
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
                (element.brand).contains('Otterbox'))
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
                (element.brand).contains('Otterbox'))
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
                (element.color).contains('Colorful'))
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
                (element.color).contains('Colorful'))
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
                (element.color).contains('Colorful'))
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
                (element.color).contains('Colorful') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Colorful') &&
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
                (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Otterbox'))
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
                (element.color).contains('Colorful') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Case-Mate'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('UAG'))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Colorful') &&
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
                (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Otterbox'))
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
                (element.brand).contains('Otterbox'))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Otterbox'))
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
                (element.brand).contains('Otterbox') &&
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
                (element.color).contains('Colorful') &&
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
                (element.color).contains('Colorful') &&
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
                (element.brand).contains('Otterbox') &&
                (element.color).contains('Colorful') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 2 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Otterbox') &&
                (element.color).contains('White') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('Otterbox') &&
                (element.color).contains('Black') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 0) {
        displaylist = items
            .where((element) =>
                (element.brand).contains('UAG') &&
                (element.color).contains('Colorful') &&
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
                (element.brand).contains('Otterbox') &&
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
                (element.brand).contains('Otterbox') &&
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
                (element.brand).contains('Otterbox') &&
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
                (element.color).contains('Colorful') &&
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
                (element.color).contains('Colorful') &&
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
                (element.color).contains('Colorful') &&
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
                (element.color).contains('Colorful') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Otterbox') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Colorful') &&
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
                (element.brand).contains('Otterbox') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 1) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Otterbox') &&
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
                (element.color).contains('Colorful') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 1 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Case-Mate') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Otterbox') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('Otterbox') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Colorful') &&
                (element.brand).contains('UAG') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 3 && selectColor == 1 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Colorful') &&
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
                (element.brand).contains('Otterbox') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 2) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Otterbox') &&
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
                (element.brand).contains('Otterbox') &&
                (element.title).toLowerCase().contains(keyword.toLowerCase()))
            .toList();
        items.refresh();
      } else if (selectBrands == 2 && selectColor == 3 && selectVersion == 3) {
        displaylist = items
            .where((element) =>
                (element.version).endsWith('iPhone 14 Pro Max') &&
                (element.color).contains('Black') &&
                (element.brand).contains('Otterbox') &&
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

  Future<void> chooseImage({required ImageSource imageSource}) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? _pickedImage = await _picker.pickImage(
        source: imageSource,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );
      if (_pickedImage != null) {
        final Rx<File> _imagePath = File(_pickedImage.path).obs;
        image = _imagePath.value;
      }
      // print(image);
      update();
      _uploadProduct(image!.path.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> _uploadProduct(String imagePath) async {
    var firebaseRef = FirebaseStorage.instance
        .ref()
        .child('new-upload/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(image!);
    var taskSnapshot =
        await uploadTask.whenComplete(() async {}).then((value) async {
      var imageUrl = await value.ref.getDownloadURL();
      pathImageStore = imageUrl;
    });
  }

  Future<void> addProduct(
      {required String title,
      required String brand,
      required String color,
      required String version,
      required int price,
      required String pathImage}) async {
    try {
      _firebaseFirestore.collection('CaseProduct').add({
        'title': title,
        'brand': brand,
        'color': color,
        'price': price,
        'version': version,
        'image': pathImage,
      }).then((value) {
        Get.snackbar('Upload', 'Upload Successful');
        titleController.clear();
        brandController.clear();
        colorController.clear();
        versionController.clear();
        priceController.clear();
        image = imageBlank;
        pathImageStore = '';
      });
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
