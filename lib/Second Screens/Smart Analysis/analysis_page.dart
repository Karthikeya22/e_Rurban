import 'package:eRurban/Second%20Screens/Smart%20Analysis/potential_labelling.dart';
import 'package:eRurban/Second%20Screens/Smart%20Analysis/time_series.dart';
import 'package:flutter/material.dart';

class SmartAnalysis extends StatefulWidget {
  const SmartAnalysis({Key key}) : super(key: key);
  @override
  _SmartAnalysisState createState() => _SmartAnalysisState();
}

class _SmartAnalysisState extends State<SmartAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Smart Analysis'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20.0, 10, 0.0),
                  child: IconButton(
                    icon: Image.asset(
                      "assets/images/time.png",
                      scale: 1,
                      height: 1000,
                      width: 1000,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (TimeSeries())));
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: IconButton(
                    icon: Image.asset("assets/images/potential.png"),
                    splashRadius: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (PotentialLabelling())));
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
