import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  final String email;
  final String img;
  final String name;

  const UserModel({required this.email, required this.img, required this.name});
  // toJson(){
  //   return {'name' : name , 'img' : img, 'email' : email};
  // }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data  = document.data()!;
    return UserModel(email: data['email'], img: data['img'], name: data['name']);
  }

}

class DoctorModel{
  // final String contact;
  final String type;
  final String img;
  final String name;
  final String workAt;
  final String id;

  const DoctorModel({required this.type,required this.img,required this.name,required this.workAt,required this.id});

  factory DoctorModel.doctorFromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return DoctorModel(type: data['type'], img: data['img'],name: data['name'],workAt: data['workAt'],id: data['id']);
  }


}

class QuickConsultParticularScreenArguments {
  final String name;
  final String type;
  final String img;

final String workAt ;
  QuickConsultParticularScreenArguments({required this.name,required this.type, required this.img,required this.workAt});
}