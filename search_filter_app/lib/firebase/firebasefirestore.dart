import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thanawat_filter/models/case_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<CaseIphone>> getCaseProduct() {
    return _firebaseFirestore
        .collection('CaseProduct')
        .orderBy('id', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => CaseIphone.fromSnapshot(doc)).toList();
    });
  }
}
