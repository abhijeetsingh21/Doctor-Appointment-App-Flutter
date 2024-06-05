// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Topcategories extends StatefulWidget {
  const Topcategories({super.key});

  @override
  State<Topcategories> createState() => _TopcategoriesState();
}

class _TopcategoriesState extends State<Topcategories> {
  List popularProducts = [
    // ['Lactogen Cerelac', '400gm', '₹ 420.00'],
    // ['Dexolac Cerelac', '400gm', '₹ 35.00'],
    // ["jhonshon's baby", '200ml', '₹ 165.00'],
    // ['Lactogen Cerelac', '400gm', '₹ 420.00'],
    // ['Dexolac Cerelac', '400gm', '₹ 35.00'],
    // ["jhonshon's baby", '200ml', '₹ 165.00'],
  ];
  Set vis = {};
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future getProductDetails() async {
    var snapshot = await firebaseFirestore
        .collection('products')
        .doc('AYnbaoqc0XAFuy4N8E77')
        .collection('baby care')
        .get();
    int snapshotLength = snapshot.docs.length;
    for (int i = 0; i < snapshotLength; i++) {
      if (!vis.contains(snapshot.docs[i]['id'])) {
        vis.add(snapshot.docs[i]['id']);
        popularProducts.add([
          snapshot.docs[i]['img'],
          snapshot.docs[i]['productName'],
          snapshot.docs[i]['qnty'],
          snapshot.docs[i]['price'],
        ]);
      }
      print(snapshot.docs[i]['img']);
    }
    print(popularProducts);
    print(vis);
  }

  @override
  Widget build(BuildContext context) {
    print(popularProducts);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                    SizedBox(width: 15.0),
                    Text(
                      'Baby Care',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.bag),
                  ],
                ),
                SizedBox(height: 15.0),
                SearchAnchor(
                  dividerColor: Colors.white,
                  viewSurfaceTintColor: Colors.white,
                  viewBackgroundColor: Colors.white,
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      // backgroundColor:,
                      leading: const Icon(Icons.search),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(
                            () {
                              controller.closeView(item);
                            },
                          );
                        },
                      );
                    });
                  },
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.location_on,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Deliver To Chennai',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          'change',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Baby Care Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Text(
                          '68 products available',
                          style: TextStyle(color: Colors.black45, fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.6135,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: getProductDetails(),
                      builder: (context, snapshot) {
                        return GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.83, crossAxisCount: 2),
                          itemCount: popularProducts.length,
                          itemBuilder: (context, idx) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    // color: Colors.blueAccent,
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        border: Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(14)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 120,
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
                                                    popularProducts[idx][0]),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Text(
                                              popularProducts[idx][1],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.black12,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Colors.yellow[600],
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    '4.9',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(popularProducts[idx][2],
                                            style:
                                                TextStyle(color: Colors.black38)),
                                        // SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(popularProducts[idx][3]),
                                            Spacer(),
                                            Icon(
                                              Icons.add_box_rounded,
                                              size: 40,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 15,
                                        child: Icon(CupertinoIcons.heart)),
                                    left: 120,
                                    right: -20,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
