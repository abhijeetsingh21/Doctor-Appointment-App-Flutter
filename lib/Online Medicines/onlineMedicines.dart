import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Onlinemedicines extends StatefulWidget {
  const Onlinemedicines({super.key});

  @override
  State<Onlinemedicines> createState() => _OnlinemedicinesState();
}

class _OnlinemedicinesState extends State<Onlinemedicines> {
  TextStyle _style = TextStyle(color: Colors.white);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
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
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
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
                            child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset('assets/images/skin2.png')),
                          )),
                          SizedBox(height: 5),
                          Text('Skin Care')
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          color: Colors.black12,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Center(
                            child: Image.asset('assets/images/eye1.png'),
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
                        color: Colors.black12,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Image.asset('assets/images/petcare.png'),
                        )),
                        SizedBox(height: 5),
                        Text('Pet Care')
                  ],
                ),
                Column(
                  children: [
                    Container(
                        color: Colors.black12,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Image.asset('assets/images/covidcare.png'),
                        )),
                        SizedBox(height: 5),
                        Text('Covid Care')
                  ],
                ),
                Column(
                  children: [
                    Container(
                        color: Colors.black12,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Image.asset('assets/images/medicaldevices1.png'),
                        )),
                        SizedBox(height: 5),
                        Text('Medical Devices')
                  ],
                ),
              ],
                            )
            ],
          ),
        ),
      ),
    );
  }
}
