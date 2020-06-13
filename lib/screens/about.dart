import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //(0xff232d37),
      appBar: AppBar(
        title: Text(
          'App Info',
          style: TextStyle(fontFamily: 'Source Sans Pro'),
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 15.0),
            Card(
              elevation: 5.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'This is an app to view charts and statistics about the current Covid-19 health emergency.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              color: Colors.blue.shade100,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 3.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  trailing: Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'This is for informational purposes only. Consult your local medical authority for further advice.',
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 16.0,
                        color: Colors.blue),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Version Number',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('v1.0.0'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Build Number',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Build: beta.0'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Disclaimer',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "All the data visualized in this application is programatically pulled from the website: www.worldometers.info/coronavirus/. Descriptive or explanatory text have also been gotten from researched based on Google.",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'VIEW SITE',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Author',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Developed by Yufenyuy Veyeh Didier'),
                    ),
                    Card(
                      color: Colors.brown,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone_android,
                            size: 20.0,
                            color: Colors.blue.shade100,
                          ),
                          title: Text(
                            '(+237) 675-007-995',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16.0,
                              color: Colors.blue.shade100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.orange,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.contact_mail,
                            size: 20.0,
                            color: Colors.blue.shade100,
                          ),
                          title: Text(
                            'yveyeh@gmail.com',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16.0,
                              color: Colors.blue.shade100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            size: 20.0,
                            color: Colors.blue.shade100,
                          ),
                          title: Text(
                            'Douala, Cameroon',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16.0,
                              color: Colors.blue.shade100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
