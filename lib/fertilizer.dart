import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fertilizer extends StatefulWidget {
  @override
  _FertilizerState createState() => _FertilizerState();
}


class _FertilizerState extends State<Fertilizer> {
  updateData()async{
    final fertilizerOptionForHec1=[
      {
        "fertilizer_name" : 'DAP',
        "unit" : "kg",
        "quantity": 150
      },
      {
        "fertilizer_name" : 'MOP',
        "unit" : "kg",
        "quantity": 100
      },
      {
        "fertilizer_name" : 'Urea',
        "unit" : "kg",
        "quantity": 200
      }
    ];

    final fertilizerOptionForAcr1=[
      {
        "fertilizer_name" : 'DAP',
        "unit" : "kg",
        "quantity": 61
      },

      {
        "fertilizer_name" : 'MOP',
        "unit" : "kg",
        "quantity": 40
      },
      {
        "fertilizer_name" : 'Urea',
        "unit" : "kg",
        "quantity": 81
      }
    ];


    final uploadData = {
      "units" : ['Hectare', 'Acre'],
      "name" : "Brinjal",
      "hectare" : fertilizerOptionForHec1,
      "acre":  fertilizerOptionForAcr1,
    };
    FirebaseFirestore.instance.collection('fertilizers').add(uploadData).then((value){
      print("Upload Success");
    });
  }

  @override
  void initState() {
   // updateData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(child: TextButton(child: Text("Upload"),onPressed: updateData,)),
        ),
      ),
    );
  }
}
