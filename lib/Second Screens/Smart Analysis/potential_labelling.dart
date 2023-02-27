import 'dart:math';

import 'package:eRurban/Views/app_theme.dart';
import 'package:eRurban/Views/app_theme_notifier.dart';
import 'package:eRurban/Views/loading_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PotentialLabelling extends StatefulWidget {
  PotentialLabelling({Key key}) : super(key: key);
  @override
  _PotentialLabelling createState() => _PotentialLabelling();
}

class _PotentialLabelling extends State<PotentialLabelling> {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final List<Map> _products = List.generate(3, (i) {
    return {"id": i, "name": "Product $i", "price": Random().nextInt(200) + 1};
  });
  bool isInProgress = false;
  int _currentSortColumn = 0;
  bool _isAscending = true;

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
              _userProfile(),
              _sizedbox1(),
              _sliderBanner(),
              _sizedbox1(),
              _categoriesWidget(),
              _sizedbox1(),
              _head1(),
              _sizedbox3(),
              _table1(),
              _sizedbox2(),
              _head2(),
              _sizedbox3(),
              _table2(),
              _sizedbox2(),
              _head3(),
              _sizedbox3(),
              _table3(),
            ],
          ));
    }
  }

  _userProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Potential Labelling",
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

  _sliderBanner() {
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

  _categoriesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 14),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
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
      height: 5,
    );
  }

  _head1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Top Clusters in A",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  _head2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Top Clusters in B",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  _head3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Top Clusters in C",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  _table1() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: _currentSortColumn,
          sortAscending: _isAscending,
          headingRowColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 218, 167, 16)),
          columns: [
            DataColumn(
                label: const Text('Id'),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['id'].compareTo(productA['id']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['id'].compareTo(productB['id']));
                    }
                  });
                }),
            DataColumn(
                label: const Text('Name'),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['name'].compareTo(productA['name']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['name'].compareTo(productB['name']));
                    }
                  });
                }),
            DataColumn(
                label: const Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['price'].compareTo(productA['price']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['price'].compareTo(productB['price']));
                    }
                  });
                }),
          ],
          rows: _products.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['id'].toString())),
              DataCell(Text(item['name'])),
              DataCell(Text(item['price'].toString()))
            ]);
          }).toList(),
        ),
      ),
    );
  }

  _table2() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: _currentSortColumn,
          sortAscending: _isAscending,
          headingRowColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 218, 167, 16)),
          columns: [
            DataColumn(
                label: const Text('Id'),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['id'].compareTo(productA['id']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['id'].compareTo(productB['id']));
                    }
                  });
                }),
            DataColumn(
                label: const Text('Name'),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['name'].compareTo(productA['name']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['name'].compareTo(productB['name']));
                    }
                  });
                }),
            DataColumn(
                label: const Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['price'].compareTo(productA['price']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['price'].compareTo(productB['price']));
                    }
                  });
                }),
          ],
          rows: _products.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['id'].toString())),
              DataCell(Text(item['name'])),
              DataCell(Text(item['price'].toString()))
            ]);
          }).toList(),
        ),
      ),
    );
  }

  _table3() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: _currentSortColumn,
          sortAscending: _isAscending,
          headingRowColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 218, 167, 16)),
          columns: [
            DataColumn(
                label: const Text('Id'),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['id'].compareTo(productA['id']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['id'].compareTo(productB['id']));
                    }
                  });
                }),
            DataColumn(
                label: const Text('Name'),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['name'].compareTo(productA['name']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['name'].compareTo(productB['name']));
                    }
                  });
                }),
            DataColumn(
                label: const Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                // Sorting function
                onSort: (columnIndex, _) {
                  setState(() {
                    _currentSortColumn = columnIndex;
                    if (_isAscending == true) {
                      _isAscending = false;
                      // sort the product list in Ascending, order by Price
                      _products.sort((productA, productB) =>
                          productB['price'].compareTo(productA['price']));
                    } else {
                      _isAscending = true;
                      // sort the product list in Descending, order by Price
                      _products.sort((productA, productB) =>
                          productA['price'].compareTo(productB['price']));
                    }
                  });
                }),
          ],
          rows: _products.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['id'].toString())),
              DataCell(Text(item['name'])),
              DataCell(Text(item['price'].toString()))
            ]);
          }).toList(),
        ),
      ),
    );
  }
}


// @override
  //   Widget build(BuildContext context) {
  //       final List<ChartData> chartData = <ChartData>[
  //          ChartData('Germany', 128, 129, 101),
  //          ChartData('Russia', 123, 92, 93),
  //          ChartData('Norway', 107, 106, 90),
  //          ChartData('USA', 87, 95, 71),
  //       ];
  //       return Scaffold(
  //           body: Center(
  //               child: Container(
  //                   child: SfCartesianChart(
  //                       primaryXAxis: CategoryAxis(),
  //                       series: <CartesianSeries>[
  //                           ColumnSeries<ChartData, String>(
  //                               dataSource: chartData,
  //                               xValueMapper: (ChartData data, _) => data.x,
  //                               yValueMapper: (ChartData data, _) => data.y
  //                           ),
  //                           ColumnSeries<ChartData, String>(
  //                               dataSource: chartData,
  //                               xValueMapper: (ChartData data, _) => data.x,
  //                               yValueMapper: (ChartData data, _) => data.y1
  //                           ),
  //                           ColumnSeries<ChartData, String>(
  //                               dataSource: chartData,
  //                               xValueMapper: (ChartData data, _) => data.x,
  //                               yValueMapper: (ChartData data, _) => data.y2
  //                           )
  //                       ]
  //                   )
  //               )
  //           )
  //       );
  //   }

  //    class ChartData {
  //       ChartData(this.x, this.y, this.y1, this.y2);
  //       final String x;
  //       final double? y;
  //       final double? y1;
  //       final double? y2;
  //     }