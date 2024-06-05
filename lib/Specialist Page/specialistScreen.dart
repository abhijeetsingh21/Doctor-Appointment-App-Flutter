import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Api/api.dart';
import 'package:doctors_appointment/Models/userModel.dart';
import 'package:doctors_appointment/consult/quickConsult.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Specialistscreen extends StatefulWidget {
  const Specialistscreen({super.key});

  @override
  State<Specialistscreen> createState() => _SpecialistscreenState();
}

class _SpecialistscreenState extends State<Specialistscreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Api.doctors.clear();
    final doctorType =
        ModalRoute.of(context)!.settings.arguments as SpecialDoctorModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(doctorType.type.toUpperCase()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder(
                future: Api.getDoctorsDetails(doctorType.type),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: Api.doctors.length,
                    itemBuilder: (context, idx) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/ParticularDoctor',
                                arguments:
                                    QuickConsultParticularScreenArguments(
                                        name: Api.doctors[idx][1],
                                        id: Api.doctors[idx][5],
                                        type: Api.doctors[idx][2],
                                        img: Api.doctors[idx][0],
                                        workAt: Api.doctors[idx][3]));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black38)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text('${availableDoctors[doctorTypeClicked]?[idx][4]}'),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                        width: double.infinity,
                                        Api.doctors[idx][0],
                                      )
                                      // availableDoctors[idx][0]),
                                      ),
                                ),
                                SizedBox(width: 15.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Api.doctors[idx][1],
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '${Api.doctors[idx][2]} | ',
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${Api.doctors[idx][3]}',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 18,
                                        ),
                                        SizedBox(width: 3),
                                        Text('4.3'),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.heart),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // ListTile(
                        //   tileColor: Colors.green,
                        //   leading: Text((idx + 1).toString()),
                        //   title: Text(Api.doctors[idx][1]),
                        //   trailing: Text(Api.doctors[idx][2]),
                        // ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
