import 'package:eRurban/Screens/authentication/Signup/signup_screen.dart';
import 'package:eRurban/Screens/settings/setting_screen.dart';
import 'package:eRurban/screens/authentication/Login/login_screen.dart';
import 'package:eRurban/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: Colors.orange,
                        elevation: 0.1,
                        onPressed: () {},
                        child: const Icon(Icons.shopping_basket)),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: currentIndex == 0
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.restaurant_menu,
                              color: currentIndex == 1
                                  ? Colors.orange
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: currentIndex == 2
                                  ? Colors.orange
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpScreen()));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: currentIndex == 3
                                  ? Colors.orange
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingScreen()));
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


// class AppScreen extends StatefulWidget {
//   int selectedPage;
//   AppScreen({Key key, this.selectedPage = 0}) : super(key: key);

//   @override
//   _AppScreenState createState() => _AppScreenState();
// }

// class _AppScreenState extends State<AppScreen>
//     with SingleTickerProviderStateMixin {
//   int _currentIndex = 0;

//   TabController _tabController;

//   _handleTabSelection() {
//     setState(() {
//       _currentIndex = _tabController.index;
//     });
//   }

//   @override
//   void initState() {
//     _tabController =  TabController(length: 4, vsync: this, initialIndex: 0);
//     _tabController.addListener(_handleTabSelection);

//     super.initState();
//   }

//   @override
//   dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   ThemeData themeData;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppThemeNotifier>(
//       builder: (BuildContext context, AppThemeNotifier value, Widget child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: Scaffold(
//             backgroundColor: const Color(0xffffffff),
//             bottomNavigationBar: BottomAppBar(
//                 elevation: 0,
//                 shape: const CircularNotchedRectangle(),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xffffffff),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xff000000).withAlpha(40),
//                         blurRadius: 3,
//                         offset: const Offset(0, -3),
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.only(top: 12, bottom: 12),
//                   child: TabBar(
//                     controller: _tabController,
//                     indicator: const BoxDecoration(),
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicatorColor: const Color(0xFF27ae61),
//                     tabs: <Widget>[
//                       Container(
//                         child: (_currentIndex == 0)
//                             ? Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   const Icon(
//                                     MdiIcons.home,
//                                     color: Color(0xFF27ae61),
//                                   ),
//                                   Container(
//                                     margin: const EdgeInsets.only(top: 4),
//                                     decoration: const BoxDecoration(
//                                         color: Color(0xFF27ae61),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(2.5))),
//                                     height: 5,
//                                     width: 10,
//                                   )
//                                 ],
//                               )
//                             : const Icon(
//                                 MdiIcons.home,
//                                 color: Color(0xff495057),
//                               ),
//                       ),
//                       Container(
//                           child: (_currentIndex == 1)
//                               ? Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     const Icon(
//                                       MdiIcons.chat,
//                                       color: Color(0xFF27ae61),
//                                     ),
//                                     Container(
//                                       margin: const EdgeInsets.only(top: 4),
//                                       decoration: const BoxDecoration(
//                                           color: Color(0xFF27ae61),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(2.5))),
//                                       height: 5,
//                                       width: 10,
//                                     )
//                                   ],
//                                 )
//                               : const Icon(
//                                   MdiIcons.chat,
//                                   color: Color(0xff495057),
//                                 )),
//                       Container(
//                           child: (_currentIndex == 2)
//                               ? Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     const Icon(
//                                       MdiIcons.bell,
//                                       color: Color(0xFF27ae61),
//                                     ),
//                                     Container(
//                                       margin: const EdgeInsets.only(top: 4),
//                                       decoration: const BoxDecoration(
//                                           color: Color(0xFF27ae61),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(2.5))),
//                                       height: 5,
//                                       width: 10,
//                                     )
//                                   ],
//                                 )
//                               : const Icon(
//                                   MdiIcons.bell,
//                                   color:  Color(0xff495057),
//                                 )),
//                       Container(
//                           child: (_currentIndex == 3)
//                               ? Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     const Icon(
//                                       MdiIcons.cog,
//                                       color:  Color(0xFF27ae61),
//                                     ),
//                                     Container(
//                                       margin: const EdgeInsets.only(top: 4),
//                                       decoration: const BoxDecoration(
//                                           color: Color(0xFF27ae61),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(2.5))),
//                                       height: 5,
//                                       width: 10,
//                                     )
//                                   ],
//                                 )
//                               : const Icon(
//                                   MdiIcons.cog,
//                                   color:  Color(0xff495057),
//                                 )),
//                     ],
//                   ),
//                 )),
//             body: TabBarView(
//               controller: _tabController,
//               children: const <Widget>[
//                 HomeScreen(),
//                 LoginScreen(),
//                 RegisterScreen(),
//                 SettingScreen()
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
