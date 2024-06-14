// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Api/api.dart';
import 'package:doctors_appointment/Models/testModel.dart';
import 'package:doctors_appointment/Online%20Medicines/onlineMedicines.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  String? email;
  int price = 165;
  int item = 1;
  String id = '';
  
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addMoreItems(String particularId) {
    setState(() {
      item += 1;
      price += 165;
    });
    _firestore
        .collection('user')
        .doc(id)
        .collection('cart')
        .doc(particularId)
        .update({'item': item, 'price': price});
  }

  subItems(String particularId) {
    setState(() {
      item -= 1;
      price -= 165;
    });
    _firestore
        .collection('user')
        .doc(id)
        .collection('cart')
        .doc(particularId)
        .update({'item': item, 'price': price});
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  StreamBuilder(
                    stream: _firestore
                        .collection('user/${Api.auth.currentUser!.uid}/cart')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        int totalAmount = 0;
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, idx) {
                                        var data = snapshot.data!.docs[idx];
                                        totalAmount +=
                                            int.parse(data['price']!);
                                        // log(data['price'].toString());
                                        log(totalAmount.toString());
                                        String docId =
                                            snapshot.data!.docs[idx].id;
                                        // log(snapshot.data!.docs.length
                                        //     .toString());

                                        return Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              // color: Colors.blueAccent,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue.shade50,
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 70,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                          fit: BoxFit.cover,
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          'https://assets.ajio.com/medias/sys_master/root/20230710/MuI8/64ac2677a9b42d15c9491aee/-473Wx593H-4931736180-multi-MODEL.jpg'),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text('Jhons Baby Lotion'),
                                                      SizedBox(height: 5),
                                                      Text('200ml'),
                                                      SizedBox(height: 10),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '₹ ${data['price']}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            width: 50,
                                                          ),
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                  height: 35,
                                                                  width: 119,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            19),
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    '${data['item']}',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14),
                                                                  ))),
                                                              Positioned(
                                                                  top: 1,
                                                                  child: GestureDetector(
                                                                      onTap: () {},
                                                                      // =>
                                                                      //     subItems(
                                                                      //         itemId),
                                                                      child: CircleAvatar(
                                                                        radius:
                                                                            16,
                                                                        backgroundColor:
                                                                            Colors.blue,
                                                                        child:
                                                                            Icon(
                                                                          CupertinoIcons
                                                                              .minus,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ))),
                                                              Positioned(
                                                                top: 1,
                                                                left: 87,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {},
                                                                  // addMoreItems(
                                                                  //     itemId),
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 16,
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
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  CircleAvatar(
                                                    radius: 18,
                                                    child: IconButton(
                                                      onPressed: () async {
                                                        await Api.firestore
                                                            .collection(
                                                                'user/${Api.auth.currentUser!.uid}/cart')
                                                            .doc(docId)
                                                            .delete();
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .delete_outline_outlined,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      '${snapshot.data!.docs.length} items in your cart',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                    ),
                                    Spacer(),
                                    Text(
                                      '+ Add more',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.04),
                                Text(
                                  'Payment Details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Sub Total',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45),
                                    ),
                                    Spacer(),
                                    Text(
                                      '₹ 345',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Tax',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45),
                                    ),
                                    Spacer(),
                                    Text(
                                      '₹ 10',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Shipping Charge',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black45),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Colors.black12,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black87),
                                    ),
                                    Spacer(),
                                    Text(
                                      '₹ $totalAmount',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.03),
                                Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          CupertinoIcons.location_solid,
                                          color: Colors.blue,
                                        )),
                                    SizedBox(width: 10),
                                    Text('Delivery To - Chennai'),
                                    Spacer(),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        // textStyle:
                                        // TextStyle(color: Colors.white)
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Change',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Text('Add Something');
                      }
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Message'),
                  content: Text('Done Shopping'),
                ),
              ),
              child: Container(
                height: size.height * 0.12,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  // color: Colors.black38
                ),
                child: Center(
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Check Out',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             id = snapshot.data!.docs[0].id;
//                           });
//                           getCartDetails(id);
//                         },
//                         child: Text('${snapshot.data?.docs[0]['name']}'));

// Container(
//                 padding: EdgeInsets.all(8),
//                 // color: Colors.blueAccent,
//                 decoration: BoxDecoration(
//                     color: Colors.blue.shade50,
//                     border: Border.all(color: Colors.black38),
//                     borderRadius: BorderRadius.circular(14)),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 70,
//                       height: 80,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15)),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Image.network(
//                             fit: BoxFit.cover,
//                             height: double.infinity,
//                             width: double.infinity,
//                             'https://assets.ajio.com/medias/sys_master/root/20230710/MuI8/64ac2677a9b42d15c9491aee/-473Wx593H-4931736180-multi-MODEL.jpg'),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text('Jhons Baby Lotion'),
//                         SizedBox(height: 5),
//                         Text('200ml'),
//                         SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Text('rs $price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14 ),),
//                             SizedBox(width: 50,),
//                             Stack(children: [

//                               Container(
//                                 height: 40,
//                                 width: 120,
//                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),color: Colors.white,),
//                                 child: Center(child: Text('$item',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),
//                               Positioned(child: GestureDetector(onTap: () => subItems(),child: CircleAvatar(backgroundColor: Colors.blue,child: Icon(CupertinoIcons.minus,size: 30,color: Colors.white,),))),
//                               Positioned(
//                                 left: 80,
//                                 child: GestureDetector(
//                                   onTap: () => addMoreItems(),
//                                   child: CircleAvatar(backgroundColor: Colors.blue,child: Icon(CupertinoIcons.add,size: 30,color: Colors.white,),)))
//                               ],)
//                           ],
//                         ),
//                       ],
//                     ),
                    
//                     Spacer(),
//                     CircleAvatar(radius: 16,child: Icon(Icons.delete_outline_outlined))
//                   ],
//                 ),
//               )