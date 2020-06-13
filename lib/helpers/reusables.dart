import 'package:flutter/material.dart';

Widget getSectionWithCards(List<List> cards, List sectionHeading) {
  return Column(
    children: <Widget>[
      sectionHeading != null
          ? ListTile(
              leading: Icon(
                sectionHeading[0],
                color: Colors.green,
                size: 40.0,
              ),
              title: Text(
                sectionHeading[1],
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(sectionHeading[2]),
            )
          : SizedBox(height: 0.0),
      for (var card in cards)
        Card(
          elevation: 5.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: card[0] != null
                  ? Icon(
                      card[0],
                      size: 20.0,
                      color: Colors.green,
                    )
                  : null,
              title: Text(
                card[1],
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              trailing: card[2] != null
                  ? Icon(
                      card[2],
                      size: 16.0,
//                color: Colors.green,
                    )
                  : null,
            ),
          ),
        ),
    ],
  );
}

Widget alertCard(String title, String subTitle, IconData trailingIcon) {
  return Card(
    elevation: 5.0,
    color: Colors.orange.shade100,
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
        title: title != ''
            ? Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
            : null,
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Source Sans Pro',
            color: Colors.red,
          ),
        ),
        trailing: trailingIcon != null
            ? Icon(
                trailingIcon,
                color: Colors.red,
              )
            : null,
      ),
    ),
  );
}

Widget infoCard(String title, IconData trailingIcon) {
  return Card(
    elevation: 5.0,
    color: Colors.blue.shade100,
    margin: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 3.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        trailing: trailingIcon != null
            ? Icon(
                trailingIcon,
                color: Colors.blue,
              )
            : null,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 16.0,
              color: Colors.blue),
        ),
      ),
    ),
  );
}

// symptoms page
