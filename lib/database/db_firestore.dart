import 'package:cloud_firestore/cloud_firestore.dart';

class FireStroredb{
  FireStroredb._();
  static final FireStroredb  _instance= FireStroredb._();
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return FireStroredb._instance._firestore;

  }


}