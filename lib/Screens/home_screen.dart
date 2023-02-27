import 'package:carousel_slider/carousel_slider.dart';
import 'package:eRurban/Second%20Screens/Leaderboard/leaderboard.dart';
import 'package:eRurban/Second%20Screens/Smart%20Analysis/analysis_page.dart';
import 'package:eRurban/Views/app_theme_notifier.dart';
import 'package:eRurban/Views/loading_screens.dart';
import 'package:eRurban/Screens/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ThemeData
  ThemeData themeData;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  //Other Variables
  bool isInProgress = false;
  int _current = 0;

  final List<String> banners = [
    "https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_758/https://www.edristi.in/wp-content/uploads/2015/09/Shyama-Prasad-Mukherji-Rurban-Mission.jpg",
    "https://rurban.gov.in/assets/image/image_gallery/photo-gallery3.jpg",
    "https://rurban.gov.in/assets/image/image_gallery/IMG-20210527-WA0012.jpg",
    "https://rurban.gov.in/assets/image/image_gallery/IMG-20210527-WA0016.jpg"
  ];

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

    await Future.delayed(const Duration(seconds: 1), () {
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
        themeData = ThemeData(
          brightness: themeType == 0
              ? Brightness.light
              : themeType == 1
                  ? Brightness.light
                  : Brightness.dark,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: themeType == 0
                  ? Colors.blue
                  : themeType == 1
                      ? Colors.green
                      : Colors.red,
            ),
            bodyText1: TextStyle(
              fontSize: 16.0,
              color: themeType == 0
                  ? Colors.blue
                  : themeType == 1
                      ? Colors.green
                      : Colors.red,
            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              color: themeType == 0
                  ? Colors.blue
                  : themeType == 1
                      ? Colors.green
                      : Colors.red,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: themeType == 0
                      ? Colors.blue
                      : themeType == 1
                          ? Colors.green
                          : Colors.red)
              .copyWith(
                  secondary: themeType == 0
                      ? Colors.blue
                      : themeType == 1
                          ? Colors.green
                          : Colors.red),
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: Scaffold(
              key: _scaffoldKey,
              backgroundColor: const Color(0xffffffff),
              body: RefreshIndicator(
                onRefresh: _refresh,
                backgroundColor: const Color(0xffffffff),
                color: const Color(0xFF27ae61),
                key: _refreshIndicatorKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                      child: isInProgress
                          ? const LinearProgressIndicator(
                              minHeight: 3,
                            )
                          : Container(
                              height: 3,
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
      return LoadingScreens.getHomeLoading(context, themeData, _scaffoldKey);
    } else if (!isInProgress) {
      return Container(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ListView(
            children: [
              _userProfile(),
              _sliderBanner(),
              _categoriesWidget(),
              _newsWidget(),
              _newsWidget2(),
            ],
          ));
    }
  }

  _userProfile() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text("Welcome to SPMRM APP",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 13, 13, 13))),
          SizedBox(
            height: 5, //welcome and name
          ),
          Text("Karthikeya Moturi",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 28, 150, 33))),
        ],
      ),
      const SizedBox(
        height: 100,
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingScreen()));
        },
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF27ae61).withAlpha(20),
                border: Border.all(width: 1),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "./assets/images/profile.jpg",
                  ),
                )),
            height: 50,
            width: 50,
          ),
        ),
      )
    ]);
  }

  _sliderBanner() {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: banners.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  // ignore: avoid_unnecessary_containers
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        i,
                        fit: BoxFit.fitWidth,
                        width: 1000,
                      ),
                    ),
                  );
                },
              );
            }).toList()),
        const SizedBox(
          height: 30, //slider and dots
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4].map((i) {
            int index = [1, 2, 3, 4].indexOf(i);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? const Color(0xFF27ae61)
                    : Colors.grey[400],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  _categoriesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 25),
        Text(
          "About the Rurban Mission",
          style: TextStyle(
            color: Color.fromARGB(255, 73, 71, 71),
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 20, //points and about
        ),
        Text(
          "The aim for the mission has been to develop rural areas by provisioning of economic, social and physical infrastructure facilities. The Mission aims at development of 300 Rurban clusters, which are essentially large parts of rural areas that are not stand-alone settlements but part of a cluster of settlements, in relative proximity of each other. These clusters typically illustrate the potential for growth, have economic drivers and derive locational and competitive advantages. These clusters once developed can be classified as 'Rurban'. ",
           textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff8F8F8F),
          ),
        )
      ],
    );
  }

  _newsWidget() {
    List<Widget> newsList = [];
    {
      newsList.add(InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => (const Leaderboard())));
          },
          child: _singleNews(1)));
    }
    return Container(
      margin: const EdgeInsets.only(top: 20),
      // padding: Spacing.only(top: 20),
      child: Column(
        children: [Column(children: newsList)],
      ),
    );
  }

  _singleNews(int index) {
    return Stack(children: [
      Container(
        height: 148,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                './assets/images/lead.jpg',
              ),
            )),
      ),
    ]);
  }

 

  _newsWidget2() {
    List<Widget> newsList = [];
    {
      newsList.add(InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => (SmartAnalysis())));
          },
          child: _singleNews2(1)));
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      // padding: Spacing.only(top: 20),
      child: Column(
        children: [Column(children: newsList)],
      ),
    );
  }

  _singleNews2(int index) {
    return Stack(children: [
      Container(
        height: 148,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  './assets/images/smart.jpg',
                ))),
      ),
    ]);
  }
}
