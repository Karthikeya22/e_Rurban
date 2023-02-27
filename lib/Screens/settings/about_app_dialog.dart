import 'package:eRurban/Views/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
class AboutAppDialog extends StatefulWidget {
  @override
  _AboutAppDialogState createState() => _AboutAppDialogState();
}

class _AboutAppDialogState extends State<AboutAppDialog> {
  ThemeData themeData;

  String appDescription =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
              elevation: 0,
              child: SizedBox.expand(
                  child: Stack(
                children: [
                  Positioned(
                      right: 5,
                      top: 5,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            MdiIcons.close,
                            color: Color(0xFF27ae61),
                          ))),
                  Positioned.fill(
                    top: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          const Text("About App : ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF27ae61))),
                          const SizedBox(height: 10),
                          const Text("eRurban",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF27ae61))),

                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.onPrimary,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  //Set your logo App Here
                                  image: AssetImage(
                                    "./assets/images/logo.jpeg",
                                  ),
                                )),
                            height: 180,
                            width: 180,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Text(appDescription,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF27ae61))),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )));
        });
      },
    );
  }
}
