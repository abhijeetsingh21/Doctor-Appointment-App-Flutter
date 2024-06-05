// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
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
                StreamBuilder(
                  stream: _firestore
                      .collection('user')
                      .where('email', isEqualTo: email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, idx) {
                            id = snapshot.data!.docs[idx].id;
                            // print(snapshot.data!.docs.length);
                            print(id);
                            return  FutureBuilder(
                                future: _firestore
                                    .collection('user')
                                    .doc(id)
                                    .collection('cart')
                                    .get(),
                                builder: (context, snapshot) {
                                  print(snapshot.data!.docs[idx].id);
                                  final data = snapshot.data!.docs[idx];
                                  final String itemId = snapshot.data!.docs[idx].id;
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    // color: Colors.blueAccent,
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        border: Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(14)),
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
                                                  'rs ${data['price']}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
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
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(19),
                                                          color: Colors.white,
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          '${data['item']}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 18),
                                                        ))),
                                                    Positioned(
                                                        child: GestureDetector(
                                                            onTap: () =>
                                                                subItems(itemId),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.blue,
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .minus,
                                                                size: 30,
                                                                color:
                                                                    Colors.white,
                                                              ),
                                                            ))),
                                                    Positioned(
                                                        left: 80,
                                                        child: GestureDetector(
                                                            onTap: () =>
                                                                addMoreItems(itemId),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.blue,
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .add,
                                                                size: 30,
                                                                color:
                                                                    Colors.white,
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
                                            child: Icon(
                                                Icons.delete_outline_outlined))
                                      ],
                                    ),
                                  );
                                });
                          });
                    } else {
                      return Text('nothing');
                    }
                  },
                )
              ],
            ),
          ),
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