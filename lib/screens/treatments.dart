import 'package:covid19stats/helpers/reusables.dart';
import 'package:flutter/material.dart';

class TreatmentScreen extends StatelessWidget {
  final selfCare = [
    [
      null,
      'If you feel sick you should rest, drink plenty of fluid, and eat nutritious food. Stay in a separate room from other family members, and use a dedicated bathroom if possible. Clean and disinfect frequently touched surfaces.',
      null,
    ],
    [
      null,
      'Everyone should keep a healthy lifestyle at home. Maintain a healthy diet, sleep, stay active, and make social contact with loved ones through the phone or internet. Children need extra love and attention from adults during difficult times. Keep to regular routines and schedules as much as possible.',
      null,
    ],
    [
      null,
      'It is normal to feel sad, stressed, or confused during a crisis. Talking to people you trust, such as friends and family, can help. If you feel overwhelmed, talk to a health worker or counsellor.',
      null,
    ],
  ];
  final medicalTreatment = [
    [
      null,
      'If you have mild symptoms and are otherwise healthy, self-isolate and contact your medical provider or a COVID-19 information line for advice. Seek medical care if you have a fever, a cough, and difficulty breathing. Call in advance.',
      null,
    ]
  ];
  final heading = [
    [
      Icons.assignment_ind,
      'Self Care',
      'Personal treatment you can apply.',
    ],
    [
      Icons.local_hospital,
      'Medical Treatment',
      'Treatment from health professionals.',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //(0xff232d37),
      appBar: AppBar(
        title: Text(
          'Treatments',
          style: TextStyle(fontFamily: 'Source Sans Pro'),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: false,
          children: <Widget>[
            SizedBox(height: 15.0),
            alertCard(
              'Current Situation',
              'According to the World Health Organization: To date, there are no specific vaccines or medicines for COVID-19.',
              Icons.warning,
            ),
            Divider(),
            getSectionWithCards(selfCare, heading[0]),
            getSectionWithCards(medicalTreatment, heading[1]),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
