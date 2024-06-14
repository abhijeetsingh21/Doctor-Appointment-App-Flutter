// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Api/api.dart';
import 'package:doctors_appointment/Models/userModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CallApi extends StatefulWidget {
  const CallApi({super.key});

  @override
  State<CallApi> createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {
  List<ModalApi> userData = [];
  Future<List<ModalApi>> hitApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      userData.add(ModalApi.fromJson(data));
    }
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: FutureBuilder(
              future: hitApi(),
              builder: (context, snapshot) {
                return ListTile(
                  leading: Text('${userData[0].id}'),
                  title: Text('${userData[0].title}'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ModalApi {
  int? userId;
  int? id;
  String? title;
  String? body;
  ModalApi({this.userId, this.id, this.title, this.body});

  ModalApi.fromJson(json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}

class LimitedListView extends StatefulWidget {
  @override
  _LimitedListViewState createState() => _LimitedListViewState();
}

class _LimitedListViewState extends State<LimitedListView> {
  String? email;
  int price = 1;
  int item = 1;
  String id = '';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addMoreItems(String particularId, int curPrice, int curCnt, int totalCost) {
    print(particularId);
    setState(() {
      curCnt += 1;
      totalCost += (curPrice);
    });
    print(particularId);
    _firestore
        .collection('user')
        .doc(id)
        .collection('cart')
        .doc(particularId)
        .update({'item': curCnt, 'totalCost': totalCost});
  }

  subItems(String particularId, int curPrice, int curCnt, int totalCost) {
    setState(() {
      curCnt -= 1;
      totalCost -= curPrice;
    });
    print(particularId);
    _firestore
        .collection('user')
        .doc(id)
        .collection('cart')
        .doc(particularId)
        .update({'item': curCnt, 'totalCost': totalCost});
  }

  Future getCartDetails(String id) async {
    await _firestore
        .collection('user')
        .doc(id)
        .collection('cart')
        .add({'price': price, 'item': item});
    // print(id);
  }

  Future<SharedPreferences> getId = SharedPreferences.getInstance();
  Future getUserEmail() async {
    final SharedPreferences _getId = await getId;
    setState(() {
      email = _getId.getString('email') ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                    SizedBox(width: 15.0),
                    Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                    stream: _firestore
                        .collection('user')
                        .where('email', isEqualTo: email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      // var tmp = snapshot.data!;
                      // print(tmp);
                      id = snapshot.data!.docs[0].id;
                      // print(id);
                      if (snapshot.hasData) {
                        // return Text('data');
                        return FutureBuilder(
                            future: _firestore
                                .collection('user')
                                .doc(id)
                                .collection('cart')
                                .get(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, idx) {
                                    // print(snapshot.data!.docs.length);
                                    final data = snapshot.data!.docs;
                                    final itemId = snapshot.data!.docs[idx].id;
                                    final itemPrice =
                                        snapshot.data!.docs[idx]['price'];
                                    final totalCost =
                                        snapshot.data!.docs[idx]['totalCost'];
                                    print(itemPrice);
                                    final itemCnt =
                                        snapshot.data!.docs[idx]['item'];
                                    // print(snapshot.data!.docs[idx].id);
                                    return Container(
                                      padding: EdgeInsets.all(8),
                                      // color: Colors.blueAccent,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                  fit: BoxFit.cover,
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  'https://assets.ajio.com/medias/sys_master/root/20230710/MuI8/64ac2677a9b42d15c9491aee/-473Wx593H-4931736180-multi-MODEL.jpg'),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('Jhons Baby Lotion'),
                                              SizedBox(height: 5),
                                              Text('200ml'),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Text(
                                                    'rs $totalCost',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Container(
                                                          height: 40,
                                                          width: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        19),
                                                            color: Colors.white,
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            '${data[idx]['item']}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ))),
                                                      Positioned(
                                                          child:
                                                              GestureDetector(
                                                                  onTap: () => subItems(
                                                                      itemId,
                                                                      itemPrice,
                                                                      itemCnt,
                                                                      totalCost),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue,
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .minus,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ))),
                                                      Positioned(
                                                          left: 80,
                                                          child:
                                                              GestureDetector(
                                                                  onTap: () => addMoreItems(
                                                                      itemId,
                                                                      itemPrice,
                                                                      itemCnt,
                                                                      totalCost),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue,
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .add,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          CircleAvatar(
                                              radius: 16,
                                              child: Icon(Icons
                                                  .delete_outline_outlined))
                                        ],
                                      ),
                                    );
                                  });
                              // });

                              // });
                            });
                      } else {
                        return Text('nothing');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
