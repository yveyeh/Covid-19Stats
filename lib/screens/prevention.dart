import 'package:covid19stats/helpers/reusables.dart';
import 'package:flutter/material.dart';

class PreventionScreen extends StatelessWidget {
  final preventionCards = [
    [
      Icons.home,
      'Stay home as much as you can.',
      null,
    ],
    [
      Icons.scatter_plot,
      'Keep a safe social distance.',
      null,
    ],
    [
      Icons.security,
      'Put on a protection mask.',
      null,
    ],
    [
      Icons.supervised_user_circle,
      'Cover your mouth properly when coughing.',
      null,
    ],
    [
      Icons.autorenew,
      'Wash your hands frequently with soap and water or an alcohol based solution.',
      null,
    ],
    [
      Icons.tag_faces,
      'Don\'t touch your eyes, nose or mouth.',
      null,
    ],
    [
      Icons.local_hospital,
      'Follow the directions of your local health authority.',
      null,
    ],
    [
      Icons.local_hotel,
      'Seek medical attention if you have a fever, cough and difficulty breathing.',
      null,
    ],
    [
      Icons.contact_phone,
      'Call in advance if you\'re sick.',
      null,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Preventive Measures',
          style: TextStyle(fontFamily: 'Source Sans Pro'),
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: false,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('images/stay-home.jpg'),
                ),
                Text(
                  'Please Save Lives',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.blue.shade100,
                  ),
                ),
                getSectionWithCards(preventionCards, null),
                infoCard(
                  'Protect yourself and others around you by knowing the facts and taking appropriate precautions. ' +
                      'Follow advice provided by your local public health agency. ' +
                      'Avoiding unneeded visits to medical facilities allows healthcare systems to operate more effectively, ' +
                      'therefore protecting you and others.',
                  null,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
