import 'package:cloud_firestore/cloud_firestore.dart';

class CaseIphone {
  late String image, title, brand, color, version;
  late int price;
  late int id;

  CaseIphone(
      {required this.id,
      required this.image,
      required this.title,
      required this.brand,
      required this.color,
      required this.version,
      required this.price});

  static CaseIphone fromSnapshot(DocumentSnapshot snap) {
    CaseIphone product = CaseIphone(
      image: snap['image'],
      title: snap['title'],
      brand: snap['brand'],
      version: snap['version'],
      id: snap['id'],
      color: snap['color'],
      price: snap['price'],
    );
    return product;
  }
}
