// import 'package:Rurban_App/app_theme.dart';
// import 'package:Rurban_App/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

// Loading Screens
class LoadingScreens {
  static Widget getHomeLoading(
      BuildContext context, ThemeData themeData, customAppTheme) {
    List<Widget> listCategory = [];
    for (int i = 0; i < 4; i++) {
      listCategory.add(Padding(
          child: boxShimmer(width: 72, height: 72),
          padding: const EdgeInsets.only(right: 5)));
      //  Spacing.all(5)));
    }

    List<Widget> listNewsItem = [];
    for (int i = 0; i < 4; i++) {
      listNewsItem.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          // Spacing.vertical(10),
          child: boxShimmer(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 1)));
    }

    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Container(
        padding: const EdgeInsets.all(24),
        // Spacing.all(24),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boxShimmer(width: 160, height: 20),
                    const SizedBox(height: 5),
                    boxShimmer(width: 200, height: 20)
                  ],
                ),
                const SizedBox(height: 20),
                circleShimmer(size: 50)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            boxShimmer(
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width * 0.5),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listCategory,
            ),
            const SizedBox(height: 16),
            Column(children: listNewsItem)
          ],
        ),
      ),
    );
  }

  static Widget getCartLoadingScreen(
      BuildContext context, ThemeData themeData, customAppTheme,
      {int itemCount = 2}) {
    Widget singleLoading = Shimmer.fromColors(
        baseColor: const Color(0xFFF5F5F5),
        highlightColor: const Color(0xFFE0E0E0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          // Spacing.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  height: 8,
                  width: 120,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: 64,
                      width: 64,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 8, width: 160, color: Colors.grey),
                                const SizedBox(height: 8),
                                Container(
                                    height: 8, width: 80, color: Colors.grey),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 8, width: 80, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(
          Container(padding: const EdgeInsets.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getOrderLoadingScreen(
      BuildContext context, ThemeData themeData, customAppTheme,
      {int itemCount = 3}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 12,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(
          Container(padding: const EdgeInsets.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getCouponLoadingScreen(
      BuildContext context, ThemeData themeData, customAppTheme,
      {int itemCount = 3}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey,
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 64,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 8,
                        width: 136,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 16),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 80,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 8,
                        width: 80,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Container(
                    height: 24,
                    width: 80,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(
          Container(padding: const EdgeInsets.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getAddressLoadingScreen(
      BuildContext context, ThemeData themeData, customAppTheme,
      {int itemCount = 3}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              MdiIcons.mapMarker,
              color: themeData.colorScheme.onBackground,
              size: 32,
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              height: 32,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 8,
                    width: 140,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 8,
                    width: 140,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(
          Container(padding: const EdgeInsets.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getReviewLoadingScreen(
      BuildContext context, ThemeData themeData, customAppTheme) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 56,
                    width: 56,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 56,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 8,
                          width: 140,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 8,
                          width: 80,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 16),
              child: Container(
                height: 16,
                width: 120,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 120,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  static Widget getConfirmPaymentLoadingScreen(
      BuildContext context, ThemeData themeData, customAppTheme) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget getSimpleImageScreen(
      BuildContext context, ThemeData themeData, customAppTheme,
      {double width = 60, double height = 60}) {
    Widget singleLoading = Shimmer.fromColors(
        baseColor: const Color(0xFFF5F5F5),
        highlightColor: const Color(0xFFE0E0E0),
        child: Container(
          height: height,
          width: width,
          color: Colors.grey,
        ));
    return singleLoading;
  }

  static Widget boxShimmer({double height, double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
    );
  }

  static Widget circleShimmer({double height, double size}) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}
