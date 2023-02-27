import 'package:eRurban/Second%20Screens/Smart%20Analysis/prediction_graph.dart';
import 'package:eRurban/Views/app_theme.dart';
import 'package:eRurban/Views/app_theme_notifier.dart';
import 'package:eRurban/Views/loading_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeSeries extends StatefulWidget {
  TimeSeries({Key key}) : super(key: key);
  @override
  _TimeSeries createState() => _TimeSeries();
}

class _TimeSeries extends State<TimeSeries> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  bool isInProgress = false;

  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadHomeData() async {
    if (mounted) {
      setState(() {
        isInProgress = true;
      });
    }

    await Future.delayed(const Duration(seconds: 0), () {
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
    });
  }

  Future<void> _refresh() async {
    _loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
              key: _scaffoldKey,
              backgroundColor: customAppTheme.bgLayer1,
              body: RefreshIndicator(
                onRefresh: _refresh,
                backgroundColor: customAppTheme.bgLayer1,
                color: themeData.colorScheme.primary,
                key: _refreshIndicatorKey,
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      child: isInProgress
                          ? const LinearProgressIndicator(
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  _buildBody() {
    if (isInProgress) {
      return LoadingScreens.getHomeLoading(context, themeData, customAppTheme);
    } else if (!isInProgress) {
      return Container(
          // padding: Spacing.only(left: 20, top: 20, right: 20),
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ListView(
            children: [
              _heading(),
              _sizedbox1(),
              _image(),
              _sizedbox2(),
              _info(),
              _sizedbox3(),
              _graph()
            ],
          ));
    }
  }

  _heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Time Series Prediction",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  _sizedbox1() {
    return const SizedBox(
      height: 20,
    );
  }

  _image() {
    return Stack(children: [
      const SizedBox(
        height: 200,
      ),
      Container(
        height: 348,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                './assets/images/time.jpeg',
              ),
            )),
      ),
    ]);
  }

  _sizedbox2() {
    return const SizedBox(
      height: 15,
    );
  }

  _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 14),
        Text(
          "Time series analysis is a statistical method to analyse the past data within a given duration of time to forecast the future. It comprises of ordered sequence of data at equally spaced interval. To understand the time series data & the analysis let us consider an example. Consider an example of Airline Passenger data. It has the count of passenger over a period. The first step is to perform the exploratory analysis which is carried out by plotting a line chart of the count of passengers against time. Figure 1 shows the count of passenger on y-axis and time on x-axis where each interval can be considered as a year.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff8F8F8F),
          ),
        ),
      ],
    );
  }

  _sizedbox3() {
    return const SizedBox(
      height: 20,
    );
  }

  _graph() {
    return IconButton(
      icon: Image.asset("assets/images/imgmap.jpg"),
      iconSize: 300,
      splashRadius: 10,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => (PredictionGraph())));
      },
    );
  }
}
