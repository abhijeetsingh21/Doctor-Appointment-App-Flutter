// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Models/testModel.dart';
import 'package:flutter/material.dart';

class MyTestScreen extends StatefulWidget {
  // String name = ModalRoute.of(context).settings.arguments ;
  // MyTestScreen({required this.name});

  @override
  State<MyTestScreen> createState() => _MyTestScreenState();
}

class _MyTestScreenState extends State<MyTestScreen> {
  
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List testInfo = [];
  Set vis = {};
  Future getLabTests(String type) async {
    final snapshot = await firebaseFirestore
        .collection('test')
        .doc('9635UiqiHNGnmaftRbDL')
        .collection(type)
        .get();
    final lengthOfDoc = snapshot.docs.length;
    for (var i = 0; i < lengthOfDoc; i++) {
      if (!vis.contains(snapshot.docs[i]['name'])) {
        vis.add(snapshot.docs[i]['name']);
        testInfo.add([
          snapshot.docs[i]['name'],
          snapshot.docs[i]['brief'],
          snapshot.docs[i]['price']
        ]);
      }
    }
    // print('this is of 1st ${[
    //   snapshot.docs[0]['name'],
    //   snapshot.docs[0]['brief'],
    //   snapshot.docs[0]['price']
    // ]}');

    print('this is testInfo List $testInfo');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments ;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap :() => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
                SizedBox(width: 15.0),
                Text(args.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: FutureBuilder(
                future: getLabTests(args.toString()),
                builder: (context, snapshot) {
                  if (testInfo.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: testInfo.length,
                      itemBuilder: (context, idx) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: size.height * 0.2,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  testInfo[idx][0],
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(testInfo[idx][1],
                                style: TextStyle(color: Colors.black38),
                                    textAlign: TextAlign.center),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 13.0, left: 8.0),
                                  child: Row(
                                    children: [
                                      Text(testInfo[idx][2],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Container(
                                            height: size.height * 0.04,
                                            width: size.width * 0.22,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Details',
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: size.width*0.03),
                                          GestureDetector(
                                            onTap: ()=> Navigator.pushNamed(context, '/scheduleAppointment'),
                                            child: Container(
                                              height: size.height * 0.04,
                                              width: size.width * 0.22,
                                              decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                border: Border.all(
                                                    color: Colors.blue),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Book Now',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No Data Found'));
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
