import 'package:eRurban/Views/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectThemeDialog extends StatefulWidget {
  const SelectThemeDialog({Key key}) : super(key: key);

  @override
  _SelectThemeDialogState createState() => _SelectThemeDialogState();
}

class _SelectThemeDialogState extends State<SelectThemeDialog> {
  ThemeData themeData;

  void _handleRadioValueChange(int value) {
    Navigator.of(context).pop();
    setState(() {
      Provider.of<AppThemeNotifier>(context, listen: false).updateTheme(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, bottom: 0),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: value.themeMode(),
                          value: 100,
                          activeColor: const Color(0xFF26B856),
                        ),
                        const Text("Light",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF26B856))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
