import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Api {
  static FirebaseAuth get auth => FirebaseAuth.instance;

  static User get user => auth.currentUser!;

  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String> getUserInfo() async {
    // log(user.phoneNumber.toString());
    // log('${user.hashCode}');
    // log(user.email.toString());
    final tmp = await _firestore.collection('user').doc(user.uid).get();
    log(tmp[0]);
    return user.uid.toString();

    // await _firestore.collection('users').doc(user.uid)
  }

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static List doctors = [];

  static Future<List> getDoctorsDetails(String type) async {
    final snapshot = await _firebaseFirestore
        .collection('doctors')
        .doc('y1AANmZ4BD7EOtGCzI6Q')
        .collection(type)
        .get();

    int listLength = snapshot.docs.length;
    // print(listLength);

    for (int i = 0; i < listLength; i++) {
      var data = snapshot.docs[i];
      doctors.add([
        data['img'],
        data['name'],
        data['type'],
        data['workAt'],
        data['contact'],
        data['id']
      ]);
    }
    return doctors;
  }

  static String?  imageUrl ;
  static String putStringText =
      'This upload has been generated using the putString method! Check the metadata too!';

  static ImagePicker _picker = ImagePicker();
  static Reference ref = FirebaseStorage.instance.ref();
  static Future uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    UploadTask uploadTask = ref
        .child("user/${auth.currentUser!.uid}/${image!.name}")
        .putFile(File(image.path));
    uploadTask;
  }

  static Future getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1500,
      maxWidth: 1500,
    );
    if (image != null) {
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
          "user/${auth.currentUser!.uid}/i"); //i is the name of the image
      log(ref.getData().toString());

      final uploadTask = firebaseStorageRef.putFile(File(image.path));
    final snapshot = await uploadTask.whenComplete(()=> {null});
    imageUrl = await snapshot.ref.getDownloadURL();
    await _firestore.collection('path').doc(auth.currentUser!.uid).set({'image' : imageUrl} );
    //   uploadTask.then((res) {
    //     // log('${res.ref.getDownloadURL()}');
    // imageUrl =  res.ref.getDownloadURL().toString();
    // // _firestore
    // //         .collection('imagePath')
    // //         .doc(auth.currentUser!.uid).collection('path').add({'imgUrl': res.ref.getDownloadURL()});
    //         // .set({'imgUrl': res.ref.getDownloadURL()});
    //   });
    } else {
      //error uploading
    }
  }
}
  


    //  return ref.putString('data');
    //  var task =  ref.putString(
    //     putStringText,
    //     metadata: SettableMetadata(
    //       contentLanguage: 'en',
    //       customMetadata: <String, String>{'example': 'putString'},
    //     ),
    //   );
    //   log(task.toString());
    //    return task;
  
