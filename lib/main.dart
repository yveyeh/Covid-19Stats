import 'dart:math';

import 'package:covid19stats/parser.dart';
import 'package:covid19stats/screens/about.dart';
import 'package:covid19stats/screens/prevention.dart';
import 'package:covid19stats/screens/symptoms.dart';
import 'package:covid19stats/screens/treatments.dart';
import 'package:covid19stats/selectCountry.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19 Stats',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey _refreshIndicatorKey = GlobalKey();
  var countryData = {
    "Global": [0, 0, 0, 0, 0, 0, 0, 0.0, true]
  };
  var chartsData = {};
  String country = "Global";

  int springAnimationDuration = 750;
  AnimationController _controller;

  @override
  initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    chartsData["Global"] = Parser.getEmptyChart();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      (_refreshIndicatorKey.currentState as dynamic)?.show();
    });
  }

  Future<void> refreshData() async {
    String localCountry = country.toString();
    var url = 'https://www.worldometers.info/coronavirus/';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      countryData = Parser.getCountryData(response.body);

      setState(() {
        _controller.forward(from: 0.0);
      });

      if (chartsData[localCountry] != null) {
        if (localCountry != "Global") {
          url += countryData[localCountry][8];
          response = await http.get(url);
          if (response.statusCode != 200) return;
        }

        var data = Parser.getChartsData(response.body);
        setState(() {
          chartsData[localCountry][0] = data[0];
          chartsData[localCountry][1] = data[1];
          chartsData[localCountry][2] = data[2];
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: Colors.blue, //(0xff232d37),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 275.0,
                child: DrawerHeader(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Card(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Covid-19 Stats',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/covid19-drawer.jpg'),
                        fit: BoxFit.cover),
//                color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'Signs and Symptoms',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                  navigateToSymptoms(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.live_help,
                  color: Colors.white,
                ),
                title: Text(
                  'Preventive Measures',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                  navigateToPrevention(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.healing,
                  color: Colors.white,
                ),
                title: Text(
                  'Treatments',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                  navigateToTreatments(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.public,
                  color: Colors.white,
                ),
                title: Text(
                  'Global Statistics',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  navigateToSelection(context);
                },
              ),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.orange,
                ),
                title: Text(
                  'About this application',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.orange,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.orange,
                  size: 18.0,
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                  navigateToAboutApp(context);
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, //(0xff232d37),
      appBar: AppBar(
        title: Text(
          "Covid19 Stats - " + country,
          style: TextStyle(fontFamily: 'Source Sans Pro'),
        ),
      ),
      body: LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: springAnimationDuration,
        key: _refreshIndicatorKey,
        showChildOpacityTransition: false,
        onRefresh: refreshData,
        child: ListView(
          padding: new EdgeInsets.symmetric(horizontal: 18),
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 15.0),
            Card(
              elevation: 5.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Cases:',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 22,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold),
                        ),
                        Counter(
                          textStyle: TextStyle(
                              color: Colors.orange,
                              fontSize: 22,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold),
                          animation: new StepTween(
                            begin: 0, //prevTotalCases,
                            end: countryData[country][0],
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Cases per Million:',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        Counter(
                          textStyle: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                          animation: new StepTween(
                            begin: 0, //prevTotalCases,
                            end: (countryData[country][7] as double).toInt(),
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'New Cases:',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        Counter(
                          textStyle: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                          animation: new StepTween(
                            begin: 0, //prevTotalCases,
                            end: countryData[country][1],
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    chartsData[country] != null ? createGraph(1) : SizedBox(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Card(
              elevation: 5.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Recovered:',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold),
                        ),
                        Counter(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold),
                          animation: new StepTween(
                            begin: 0, //prevRecoveredCases,
                            end: countryData[country][4],
                          ).animate(_controller),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Active Cases:',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        Counter(
                          textStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                          animation: new StepTween(
                            begin: 0, //prevTotalCases,
                            end: countryData[country][5],
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    chartsData[country] != null ? createGraph(2) : SizedBox(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Card(
              elevation: 5.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Deaths:',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold),
                        ),
                        Counter(
                          textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold),
                          animation: new StepTween(
                            begin: 0, //prevDeathCases,
                            end: countryData[country][2],
                          ).animate(_controller),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Serious Cases:',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        Counter(
                          textStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                          animation: new StepTween(
                            begin: 0, //prevTotalCases,
                            end: countryData[country][6],
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'New Deaths:',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        Counter(
                          textStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                          ),
                          animation: new StepTween(
                            begin: 0, //prevTotalCases,
                            end: countryData[country][3],
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    chartsData[country] != null ? createGraph(3) : SizedBox(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            chartsData[country] == null && countryData[country][8] != null
                ? FlatButton(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Load Charts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Source Sans Pro'),
                            ),
                          ],
                        )),
                    onPressed: () {
                      setState(() {
                        chartsData[country] = Parser.getEmptyChart();
                      });
                      (_refreshIndicatorKey.currentState as dynamic)?.show();
                    },
                  )
                : SizedBox(),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: countryData.length > 1 ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: FloatingActionButton(
          onPressed: () {
            navigateToSelection(context);
          },
          tooltip: 'Select Country',
          child: Icon(Icons.public),
        ),
      ),
    );
  }

  navigateToSymptoms(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SymptomsScreen(),
      ),
    );
  }

  navigateToPrevention(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreventionScreen(),
      ),
    );
  }

  navigateToTreatments(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TreatmentScreen(),
      ),
    );
  }

  navigateToSelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionScreen(
          countries: countryData.keys.toList(),
          selectedCountry: country,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        country = result;
        _controller.forward(from: 0.0);
      });
    }
  }

  navigateToAboutApp(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutScreen(),
      ),
    );
  }

  Widget createGraph(int type) {
    var dataAvailable = chartsData[country][type - 1].length == 4 &&
        !chartsData[country][type - 1][3];
    var daily = chartsData[country][2 + type];
    var lineChartData = daily
        ? dailyData(chartsData[country][type - 1])
        : totalData(chartsData[country][type - 1]);
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 12.0, top: 24, bottom: 12),
                child: new LineChart(lineChartData,
                    swapAnimationDuration: Duration(seconds: 1))),
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: dataAvailable,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 0, 0, 16),
                child: Text(
                  "Data Not Available",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 4, 32),
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    chartsData[country][2 + type] =
                        !chartsData[country][2 + type];
                  });
                },
                child: Wrap(
                  children: <Widget>[
                    Card(
                      color: Colors.blue,
                      elevation: 10.0,
                      child: Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.autorenew,
                                  color: Colors.white, size: 12),
                              Text(
                                chartsData[country][2 + type]
                                    ? ' Daily'
                                    : ' Total',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData totalData(List data) {
    //xLabels, List<int> values, List<Color> gradientColors) {
    var xLabels = data[0] as List<String>;
    var values = data[1] as List<int>;
    var gradientColors = data[2] as List<Color>;
    double vInterval = values.reduce(max).toDouble() / 4;
    double hInterval = xLabels.length.toDouble() / 4;

    List<FlSpot> spots = [];
    for (int i = 0; i < values.length; i++) {
      spots.add(FlSpot(i.toDouble(), values[i].toDouble()));
    }

    FlLine gridLine = FlLine(
      color: Color(0xff37434d),
      strokeWidth: 1,
    );

    FlLine nullLine = FlLine(
      color: Colors.transparent,
      strokeWidth: 0,
    );

    return LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: vInterval,
        verticalInterval: 5.0,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return gridLine;
        },
        getDrawingVerticalLine: (value) {
          if (value % hInterval < 5) return gridLine;
          return nullLine;
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          interval: hInterval,
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 12),
          getTitles: (value) {
            return xLabels[value.toInt()];
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          interval: vInterval,
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            var label;
            if (value >= 1000000)
              label = (value.toInt() / 1000000).toStringAsFixed(2) + "M";
            else if (value >= 1000)
              label = (value.toInt() ~/ 1000).toString() + "K";
            else
              label = value.toInt().toString();
            return label;
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: (values.length - 1).toDouble(),
      minY: 0,
      maxY: values.reduce(max).toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData dailyData(List data) {
    //xLabels, List<int> values, List<Color> gradientColors) {
    var xLabels = data[0] as List<String>;
    var values = data[1] as List<int>;
    var gradientColors = data[2] as List<Color>;

    double maxValue = 0;
    List<FlSpot> spots = [];
    for (int i = values.length - 1; i > 0; i--) {
      double val = max((values[i] - values[i - 1]).toDouble(), 0.0);
      spots.add(FlSpot(i.toDouble(), val));
      maxValue = val > maxValue ? val : maxValue;
    }
    spots.add(FlSpot(0.0, values[0].toDouble()));
    spots = new List.from(spots.reversed);

    double vInterval = maxValue / 4;
    double hInterval = xLabels.length.toDouble() / 4;

    FlLine gridLine = FlLine(
      color: Color(0xff37434d),
      strokeWidth: 1,
    );

    FlLine nullLine = FlLine(
      color: Colors.transparent,
      strokeWidth: 0,
    );

    return LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: vInterval,
        verticalInterval: 5.0,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return gridLine;
        },
        getDrawingVerticalLine: (value) {
          if (value % hInterval < 5) return gridLine;
          return nullLine;
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          interval: hInterval,
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: const Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: 'Source Sans Pro',
          ),
          getTitles: (value) {
            return xLabels[value.toInt()];
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          interval: vInterval,
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: 'Source Sans Pro',
          ),
          getTitles: (value) {
            var label;
            if (value >= 1000)
              label = (value.toInt() ~/ 1000).toString() + "K";
            else
              label = value.toInt().toString();
            return label;
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: (values.length - 1).toDouble(),
      minY: 0,
      maxY: maxValue,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}

class Counter extends AnimatedWidget {
  Counter({Key key, this.animation, this.textStyle})
      : super(key: key, listenable: animation);
  final Animation<int> animation;
  final TextStyle textStyle;

  @override
  build(BuildContext context) {
    return new Text(
      animation.value.toString(),
      style: textStyle,
    );
  }
}
