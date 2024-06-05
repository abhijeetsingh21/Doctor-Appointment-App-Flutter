// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onlinemedicines extends StatefulWidget {
  const Onlinemedicines({super.key});

  @override
  State<Onlinemedicines> createState() => _OnlinemedicinesState();
}

class _OnlinemedicinesState extends State<Onlinemedicines> {
  List popularMedicines = [
    ['Calpol 500', '15pcs', 20.00],
    ['Dolo 650', '15pcs', 35.00],
    ['ORSL Drink', '200ml',42.00],
  ];
  TextStyle _style = TextStyle(color: Colors.white);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                    SizedBox(width: 15.0),
                    Text(
                      'Medicine',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.bag)
                  ],
                ),
                SizedBox(height: 20),
                SearchAnchor(
                  builder: (context, item) {
                    return SearchBar(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black45,
                        size: 35,
                      ),
                      controller: _controller,
                    );
                  },
                  suggestionsBuilder: (context, ter) {
                    return List<ListTile>.generate(5, (int ind) {
                      return ListTile(
                        title: Text('$ind'),
                      );
                    });
                  },
                ),
                SizedBox(height: 15),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black38)),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                                'UPload Presctiption Order via Prescription')),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Upload',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromHeight(2),
                              backgroundColor: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // ignore: prefer_const_constructors
                Row(
                  children: [
                    Text(
                      'Top Categories',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context,'/TopCategories'),
                            child: Container(
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.2,
                                // decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(0)),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                        // fit: BoxFit.cover,
                                        // height: double.infinity,
                                        // width: double.infinity,
                                        'assets/images/baby1.png'),
                                  ),
                                )),
                          ),
                          SizedBox(height: 5),
                          Text('Baby Care')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Image.asset('assets/images/skin2.png')),
                              )),
                          SizedBox(height: 5),
                          Text('Skin Care')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Image.asset('assets/images/eye1.png')),
                              )),
                          SizedBox(height: 5),
                          Text('Eye Care')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child:
                                      Image.asset('assets/images/petcare.png')),
                            )),
                        SizedBox(height: 5),
                        Text('Pet Care')
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      'assets/images/covidcare.png')),
                            )),
                        SizedBox(height: 5),
                        Text('Covid Care')
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(
                              child: ClipRRect(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/images/medicaldevices1.png'))),
                            )),
                        SizedBox(height: 5),
                        Text('Medical Devices')
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Popular Product',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.29,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: popularMedicines.length,
                    itemBuilder: (context, idx) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          // height: 200,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                    // color:  Colors.black,
                                    height: 70,
                                    width: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          height: double.infinity,
                                          width: double.infinity,
                                          'https://t4.ftcdn.net/jpg/02/81/42/77/360_F_281427785_gfahY8bX4VYCGo6jlfO8St38wS9cJQop.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    popularMedicines[idx][0],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
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
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(popularMedicines[idx][1],
                                  style: TextStyle(color: Colors.black38)),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('₹'),
                                  SizedBox(width: 5),
                                  Text(popularMedicines[idx][2].toString()),
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
                      );
                    },
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
