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

  Set<String> brandFilters = {
    'Case-Mate',
    'Otterbox',
    'UAG',
  };

  Set<String> colorFilters = {
    'Colorful',
    'White',
    'Black',
  };

  Set<String> versionFilters = {
    'iPhone 14',
    'iPhone 14 Pro',
    'iPhone 14 Pro Max',
  };

  onSelectCate(String keyword) {
    displaylist = items;

    if (selectBrands > 0) {
      displaylist = displaylist
          .where((item) =>
              item.brand.contains(brandFilters.elementAt(selectBrands - 1)))
          .toList();
    }

    if (selectColor > 0) {
      displaylist = displaylist
          .where((item) =>
              item.color.contains(colorFilters.elementAt(selectColor - 1)))
          .toList();
    }

    if (selectVersion > 0) {
      displaylist = displaylist
          .where((item) => item.version
              .endsWith(versionFilters.elementAt(selectVersion - 1)))
          .toList();
    }

    if (keyword.trim().isNotEmpty) {
      displaylist = displaylist
          .where((item) =>
              item.title.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    items.refresh();
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
        // Get.snackbar('Upload', 'Upload Successful');
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
