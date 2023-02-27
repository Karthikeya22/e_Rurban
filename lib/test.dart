// import 'package:eRurban/Views/app_theme_notifier.dart';
// import 'package:eRurban/Views/loading_screens.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// class ClusterRanking extends StatefulWidget {
//   const ClusterRanking({Key key}) : super(key: key);
//   @override
//   _ClusterRankingState createState() => _ClusterRankingState();
// }

// class _ClusterRankingState extends State<ClusterRanking> {
//   //ThemeData
//   ThemeData themeData;

//   //Global Keys
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//       GlobalKey<RefreshIndicatorState>();

//   //Other Variables
//   bool isInProgress = false;
//   int _current = 0;

//   Map mapResponse;
//   List stateWise;
//   List clusterWise;
//   Future fetchData() async {
//     http.Response response;
//     response = await http.get(Uri.parse('http://172.16.103.65:8080/leader'));
//     if (response.statusCode == 200) {
//       setState(() {
//         mapResponse = json.decode(response.body);
//         stateWise = mapResponse['statewise'];
//         clusterWise = mapResponse['clusterwise'];
//       });
//     }
//   }

//   final List<String> banners = [
//     "https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_758/https://www.edristi.in/wp-content/uploads/2015/09/Shyama-Prasad-Mukherji-Rurban-Mission.jpg",
//     "https://rurban.gov.in/assets/image/image_gallery/photo-gallery3.jpg",
//     "https://rurban.gov.in/assets/image/image_gallery/IMG-20210527-WA0012.jpg",
//     "https://rurban.gov.in/assets/image/image_gallery/IMG-20210527-WA0016.jpg"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadHomeData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   _loadHomeData() async {
//     if (mounted) {
//       setState(() {
//         isInProgress = true;
//       });
//     }

//     await Future.delayed(const Duration(seconds: 1), () {
//       if (mounted) {
//         setState(() {
//           isInProgress = false;
//         });
//       }
//     });
//   }

//   Future<void> _refresh() async {
//     _loadHomeData();
//   }

//   int _currentSortColumn = 0;
//   bool _isAscending = true;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppThemeNotifier>(
//       builder: (BuildContext context, AppThemeNotifier value, Widget child) {
//         int themeType = value.themeMode();
//         themeData = ThemeData(
//           brightness: themeType == 0
//               ? Brightness.light
//               : themeType == 1
//                   ? Brightness.light
//                   : Brightness.dark,
//           textTheme: TextTheme(
//             headline6: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//               color: themeType == 0
//                   ? Colors.blue
//                   : themeType == 1
//                       ? Colors.green
//                       : Colors.red,
//             ),
//             bodyText1: TextStyle(
//               fontSize: 16.0,
//               color: themeType == 0
//                   ? Colors.blue
//                   : themeType == 1
//                       ? Colors.green
//                       : Colors.red,
//             ),
//             bodyText2: TextStyle(
//               fontSize: 14.0,
//               color: themeType == 0
//                   ? Colors.blue
//                   : themeType == 1
//                       ? Colors.green
//                       : Colors.red,
//             ),
//           ),
//           colorScheme: ColorScheme.fromSwatch(
//                   primarySwatch: themeType == 0
//                       ? Colors.blue
//                       : themeType == 1
//                           ? Colors.green
//                           : Colors.red)
//               .copyWith(
//                   secondary: themeType == 0
//                       ? Colors.blue
//                       : themeType == 1
//                           ? Colors.green
//                           : Colors.red),
//         );
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: themeData,
//           home: Scaffold(
//               key: _scaffoldKey,
//               backgroundColor: const Color(0xffffffff),
//               body: RefreshIndicator(
//                 onRefresh: _refresh,
//                 backgroundColor: const Color(0xffffffff),
//                 color: const Color(0xFF27ae61),
//                 key: _refreshIndicatorKey,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 3,
//                       child: isInProgress
//                           ? const LinearProgressIndicator(
//                               minHeight: 3,
//                             )
//                           : Container(
//                               height: 3,
//                             ),
//                     ),
//                     Expanded(
//                       child: _buildBody(),
//                     )
//                   ],
//                 ),
//               )),
//         );
//       },
//     );
//   }

//   _buildBody() {
//     if (isInProgress) {
//       return LoadingScreens.getHomeLoading(context, themeData, _scaffoldKey);
//     } else if (!isInProgress) {
//       return Container(
//           padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
//           child: ListView(
//             children: [
//               _datatable(),
//             ],
//           ));
//     }
//   }

//   _datatable() {
//     return SizedBox(
//       width: double.infinity,
//       child: SingleChildScrollView(
//         child: DataTable(
//           sortColumnIndex: _currentSortColumn,
//           sortAscending: _isAscending,
//           headingRowColor:
//               MaterialStateProperty.all(Color.fromARGB(255, 218, 167, 16)),
//           columns: [
//             DataColumn(
//                 label: const Text('Id'),
//                 // Sorting function
//                 onSort: (columnIndex, _) {
//                   setState(() {
//                     _currentSortColumn = columnIndex;
//                     if (_isAscending == true) {
//                       _isAscending = false;
//                       // sort the product list in Ascending, order by score
//                       clusterWise.sort((productA, productB) =>
//                           productB['id'].compareTo(productA['id']));
//                     } else {
//                       _isAscending = true;
//                       // sort the product list in Descending, order by score
//                       clusterWise.sort((productA, productB) =>
//                           productA['id'].compareTo(productB['id']));
//                     }
//                   });
//                 }),
//             DataColumn(
//                 label: const Text('state'),
//                 // Sorting function
//                 onSort: (columnIndex, _) {
//                   setState(() {
//                     _currentSortColumn = columnIndex;
//                     if (_isAscending == true) {
//                       _isAscending = false;
//                       // sort the product list in Ascending, order by score
//                       clusterWise.sort((productA, productB) =>
//                           productB['state'].compareTo(productA['state']));
//                     } else {
//                       _isAscending = true;
//                       // sort the product list in Descending, order by score
//                       clusterWise.sort((productA, productB) =>
//                           productA['state'].compareTo(productB['state']));
//                     }
//                   });
//                 }),
//             DataColumn(
//                 label: const Text(
//                   'score',
//                   style: TextStyle(
//                       color: Colors.blue, fontWeight: FontWeight.bold),
//                 ),
//                 // Sorting function
//                 onSort: (columnIndex, _) {
//                   setState(() {
//                     _currentSortColumn = columnIndex;
//                     if (_isAscending == true) {
//                       _isAscending = false;
//                       // sort the product list in Ascending, order by score
//                       clusterWise.sort((productA, productB) =>
//                           productB['score'].compareTo(productA['score']));
//                     } else {
//                       _isAscending = true;
//                       // sort the product list in Descending, order by score
//                       clusterWise.sort((productA, productB) =>
//                           productA['score'].compareTo(productB['score']));
//                     }
//                   });
//                 }),
//           ],
//           rows: clusterWise.map((item) {
//             return DataRow(cells: [
//               DataCell(Text(item['Clusteridx'].toString())),
//               DataCell(Text(item['state'])),
//               DataCell(Text(
//                   double.parse(item['score'].toStringAsFixed(2)).toString()))
//             ]);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
