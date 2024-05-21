import 'package:cloud_firestore/cloud_firestore.dart';

class Testmodel {
  String name;
  String price;
  String breif;

  Testmodel({required this.name,required this.price,required this.breif});

  factory Testmodel.testFromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Testmodel(name: data['name'], breif: data['breif'], price: data['price']);
  }
}