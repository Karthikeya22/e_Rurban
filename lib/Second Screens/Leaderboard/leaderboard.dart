import 'package:eRurban/Second%20Screens/Leaderboard/cluster_ranking.dart';
import 'package:eRurban/Second%20Screens/Leaderboard/state_ranking.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key key}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

@override
class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Leaderboard Categories"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg1.jpg"),
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
                      "assets/images/cluster.png",
                      scale: 1,
                      height: 1000,
                      width: 1000,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (const ClusterRanking())));
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: IconButton(
                    icon: Image.asset("assets/images/state.png"),
                    splashRadius: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (const StateRanking())));
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
