// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Models/testModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabTest extends StatefulWidget {
  const LabTest({super.key});

  @override
  State<LabTest> createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
  

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
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
                    'Lab Test',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.insert_page_break_outlined)
                ],
              ),
              SizedBox(height: 15),
              SearchAnchor(
                builder: (context, item) {
                  return SearchBar(
                    leading: Icon(
                      Icons.search,
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
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Nearby Labs',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    NearbyLabs(size: size),
                    SizedBox(width: 16),
                    NearbyLabs(size: size),
                    SizedBox(width: 16),
                    NearbyLabs(size: size),
                    SizedBox(width: 16),
                    NearbyLabs(size: size),
                    SizedBox(width: 16),
                    NearbyLabs(size: size),
                    SizedBox(width: 16),
                    NearbyLabs(size: size),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Test Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()=> Navigator.pushNamed(context, '/TestScreen',arguments: 'CT Scan'),
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'CT \nScan',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context,'/TestScreen', arguments: 'Doopler Scan'),
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Doopler \nScan',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context,'/TestScreen' ,arguments: 'MRI Scan'),
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'MRI \nScan',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context,'/TestScreen', arguments: 'Dexa Scan'),
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Dexa \nScan',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Popular Test',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                height: size.height * 0.12,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          'https://thecurekolkata.files.wordpress.com/2014/08/the-cure-bp-check.jpg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bp Measure',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Test for high or low \n blood pressure',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context, '/scheduleAppointment'),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text('Book Now',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                height: size.height * 0.12,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          'https://thecurekolkata.files.wordpress.com/2014/08/the-cure-bp-check.jpg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bp Measure',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Test for high or low \n blood pressure',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context, '/scheduleAppointment'),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text('Book Now',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                height: size.height * 0.12,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          'https://thecurekolkata.files.wordpress.com/2014/08/the-cure-bp-check.jpg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bp Measure',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Test for high or low \n blood pressure',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context, '/scheduleAppointment'),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text('Book Now',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                height: size.height * 0.12,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          'https://thecurekolkata.files.wordpress.com/2014/08/the-cure-bp-check.jpg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bp Measure',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Test for high or low \n blood pressure',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context, '/scheduleAppointment'),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text('Book Now',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }
}

class NearbyLabs extends StatelessWidget {
  const NearbyLabs({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: size.height * 0.19,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                'https://indiaeducationdiary.in/wp-content/uploads/2023/10/Media_1009618_smxx.png'),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'HIFI-Scan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),

                    // SizedBox()
                    Text('4.9'),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                CupertinoIcons.location_solid,
                size: 18,
                color: Colors.black26,
              ),
              SizedBox(width: 5),
              Text(
                '1km away',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
