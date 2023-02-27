import 'package:eRurban/Screens/authentication/Login/login_screen.dart';
import 'package:eRurban/Screens/authentication/Signup/signup_screen.dart';
import 'package:eRurban/Screens/home_screen.dart';
import 'package:eRurban/Screens/settings/about_app_dialog.dart';
import 'package:eRurban/Views/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  //ThemeData
  ThemeData themeData;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Other Variables
  bool isInProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: Scaffold(
                key: _scaffoldKey,
                backgroundColor: const Color(0xffffffff),
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 26, 188, 8),
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                body: Column(
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
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
                    ),
                  ],
                )));
      },
    );
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF27ae61).withAlpha(20),
                      border: Border.all(width: 1),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "./assets/images/person.jpg",
                        ),
                      )),
                  height: 67,
                  width: 67,
                ),
              ),
              Container(width: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Karthikeya Moturi",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF27ae61))),
                ],
              ),
            ],
          ),
        ),
        const Divider(),

        const Spacer(),

        _menuItem(title: "Dashboard", icon: MdiIcons.home, onTap: () {
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (const HomeScreen())));
        }),

        const Spacer(),
        _menuItem(title: "Login", icon: MdiIcons.account, onTap: () {
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (const LoginScreen())));
        }),
        const Spacer(),
        _menuItem(title: "Register", icon: MdiIcons.accountPlus, onTap: () {
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  (const SignUpScreen())));
        }),
        const Spacer(),
        _menuItem(title: "Contact Us", icon: MdiIcons.accountPlus, onTap: () {}),
        const Spacer(),
        _menuItem(
            title: "About",
            icon: MdiIcons.frequentlyAskedQuestions,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AboutAppDialog());
            }),
      ],
    );
  }

  _menuItem({String title, IconData icon, Function onTap}) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xff495057),
                  size: 28,
                ),
                const SizedBox(width: 24),
                Text(title,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4a4c4f))),
              ],
            )));
  }
}
