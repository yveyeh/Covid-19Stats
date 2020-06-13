import 'package:covid19stats/helpers/reusables.dart';
import 'package:flutter/material.dart';

class SymptomsScreen extends StatelessWidget {
  final alertCardTexts = [
    'Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility.',
    'People with mild symptoms who are otherwise healthy should manage their symptoms at home.',
    'On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Signs & Symptoms',
          style: TextStyle(fontFamily: 'Source Sans Pro'),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 10.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            infoCard(
              'COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.',
              Icons.info_outline,
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(
                Icons.local_hospital,
                color: Colors.green,
              ),
              title: Text(
                'Less common',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Scroll horizontally for more...'),
              trailing: Icon(
                Icons.code,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 175.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/unwell.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Aches and Pains",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/throat-spray.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Sore Throat",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/bacteria.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Diarrhoea",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/millenium-eye.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Conjunctivitis",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/fever.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Headache",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/smell.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Taste/Smell Loss",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/limbs.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Discolored Limbs",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/bacteria.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Skin Rashes",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(
                Icons.local_hospital,
                color: Colors.green,
              ),
              title: Text(
                'Most Common',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Scroll horizontally for more...'),
              trailing: Icon(
                Icons.code,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 175.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/fever.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Fever",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/cough.png'),
//                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Dry Cough",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/tiredness.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Tiredness",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(
                Icons.local_hospital,
                color: Colors.green,
              ),
              title: Text(
                'Serious Symptoms',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Scroll horizontally for more...'),
              trailing: Icon(
                Icons.code,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 175.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/breath.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Chest Pain",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/speech.png'),
//                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Speech Loss",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      width: 160.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/breath.png'),
//                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Breath Shortness",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            for (var text in alertCardTexts)
              alertCard('', text, Icons.thumb_up),
          ],
        ),
      ),
    );
  }
}
