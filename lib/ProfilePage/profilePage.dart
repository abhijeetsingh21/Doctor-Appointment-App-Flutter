// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Api/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                StreamBuilder(
                    stream: firebaseFirestore
                        .collection('user')
                        .doc(Api.auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      // log(snapshot.data!['name']);
                      if (snapshot.hasData) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Hero(
                                        tag: 'profilePic',
                                        child: AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          content: Container(
                                            height: size.height * 0.33,
                                            width: size.width * 0.7,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10000),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10000),
                                              child: Image.network(
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                snapshot.data!['img'] ,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Hero(
                                tag: 'profilePic',
                                child: CircleAvatar(
                                  radius: size.height * 0.04,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        snapshot.data!['img']),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Hi, ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      snapshot.data!['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                Text(
                                  'Welcome to Dr.Lab',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Edit'),
                                    content: SizedBox(
                                      height: 70,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Api.uploadUserImage();
                                            },
                                            child: Text(
                                              'Change Profile pic',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          Divider(),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      // title:
                                                      // Text('Change name'),
                                                      content: SizedBox(
                                                        height: 100,
                                                        width: 50,
                                                        child: Column(
                                                          children: [
                                                            TextFormField(
                                                              controller:
                                                                  nameTextController,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Change name',
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .black12),
                                                                prefixIcon: Icon(
                                                                    CupertinoIcons
                                                                        .person,
                                                                    color: Colors
                                                                        .blue),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black12),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black12),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  if (nameTextController
                                                                          .text !=
                                                                      '') {
                                                                    await Api
                                                                        .firestore
                                                                        .collection(
                                                                            'user')
                                                                        .doc(Api
                                                                            .auth
                                                                            .currentUser!
                                                                            .uid)
                                                                        .update({
                                                                      'name':
                                                                          nameTextController
                                                                              .text
                                                                    });
                                                                  }

                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      '/BottomNav');
                                                                },
                                                                child: Text(
                                                                  'Change',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          17),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Text(
                                              'Change Name',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              child: Container(
                                height: size.height * 0.043,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('nothing');
                      }
                    }),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  // height: size.height * 0.4,
                  // width: size.width * 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(10, 10))]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      GeneralFields(
                        icon: Icon(
                          CupertinoIcons.person_2,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Manage family Members',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GeneralFields(
                          icon: Icon(
                            CupertinoIcons.bag,
                            color: Colors.blue,
                            size: 25,
                          ),
                          fieldName: 'My Consults',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/cartScreen'),
                        child: GeneralFields(
                          icon: Icon(
                            CupertinoIcons.doc_text,
                            color: Colors.blue,
                            size: 25,
                          ),
                          fieldName: 'My Orders',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GeneralFields(
                        icon: Icon(
                          CupertinoIcons.doc_text_search,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Health Records',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GeneralFields(
                        icon: Icon(
                          Icons.payment_outlined,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Payment Methods',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GeneralFields(
                        icon: Icon(
                          CupertinoIcons.doc_append,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Privacy Policy',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GeneralFields(
                        icon: Icon(
                          CupertinoIcons.chat_bubble_text,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'FAQs',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SettingFields(
                        icon: Icon(
                          CupertinoIcons.bell,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Pop-up Notification',
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      SettingFields(
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Text Message',
                      ),

                      SettingFields(
                        icon: Icon(
                          CupertinoIcons.phone,
                          color: Colors.blue,
                          size: 25,
                        ),
                        fieldName: 'Customer Calls',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('loginState', false);
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.logout_sharp,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingFields extends StatelessWidget {
  Icon? icon;
  String? fieldName;
  SettingFields({
    required this.icon,
    required this.fieldName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon!,
        // Icon(
        //   CupertinoIcons.bell,
        //   color: Colors.blue,
        //   size: 25,
        // ),
        SizedBox(
          width: 10,
        ),
        Text(
          fieldName!,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Spacer(),
        Switch(value: false, onChanged: (val) {}),
        // Icon(
        //   CupertinoIcons.chevron_right,
        //   color: Colors.black45,
        // ),
      ],
    );
  }
}

class GeneralFields extends StatelessWidget {
  Icon? icon;
  String? fieldName;
  Function? tapFunction;
  GeneralFields({
    required this.icon,
    required this.fieldName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon!,
        SizedBox(
          width: 10,
        ),
        Text(
          fieldName!,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Spacer(),
        Icon(
          CupertinoIcons.chevron_right,
          color: Colors.black45,
        ),
      ],
    );
  }
}
