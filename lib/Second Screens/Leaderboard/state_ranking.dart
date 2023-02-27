import 'package:flutter/material.dart';

class StateRanking extends StatefulWidget {
  const StateRanking({Key key}) : super(key: key);
  @override
  _StateRankingState createState() => _StateRankingState();
}

class _StateRankingState extends State<StateRanking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(children: <Widget>[
        Center(
            child: Text(
          'Statewise Ranking',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('Rank',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('State',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Score',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Tripura')),
              DataCell(Text('68.15906249999999')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Meghalaya')),
              DataCell(Text('62.49749255509232')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Odisha')),
              DataCell(Text('54.358878105590065')),
            ]),
            DataRow(cells: [
              DataCell(Text('4')),
              DataCell(Text('Kerala')),
              DataCell(Text('51.969603174603165')),
            ]),
            DataRow(cells: [
              DataCell(Text('5')),
              DataCell(Text('Sikkim')),
              DataCell(Text('51.88636363636365')),
            ]),
            DataRow(cells: [
              DataCell(Text('6')),
              DataCell(Text('Jammu Kashmir')),
              DataCell(Text('51.424127531236536')),
            ]),
            DataRow(cells: [
              DataCell(Text('7')),
              DataCell(Text('Tamil Nadu')),
              DataCell(Text('47.162879120879126')),
            ]),
            DataRow(cells: [
              DataCell(Text('8')),
              DataCell(Text('Telangana')),
              DataCell(Text('45.40085714285714')),
            ]),
            DataRow(cells: [
              DataCell(Text('9')),
              DataCell(Text('Rajasthan')),
              DataCell(Text('45.29376228932584')),
            ]),
            DataRow(cells: [
              DataCell(Text('10')),
              DataCell(Text('Andhra Pradesh')),
              DataCell(Text('44.13837837837838')),
            ]),
            DataRow(cells: [
              DataCell(Text('11')),
              DataCell(Text('Karnataka')),
              DataCell(Text('43.58773319703552')),
            ]),
            DataRow(cells: [
              DataCell(Text('12')),
              DataCell(Text('Himachal Pradesh')),
              DataCell(Text('42.40750878563062')),
            ]),
            DataRow(cells: [
              DataCell(Text('13')),
              DataCell(Text('Chhattisgarh')),
              DataCell(Text('42.12693490517683')),
            ]),
            DataRow(cells: [
              DataCell(Text('14')),
              DataCell(Text('Jharkhand')),
              DataCell(Text('41.75609932885906')),
            ]),
            DataRow(cells: [
              DataCell(Text('15')),
              DataCell(Text('Haryana')),
              DataCell(Text('37.123174311926604')),
            ]),
            DataRow(cells: [
              DataCell(Text('16')),
              DataCell(Text('Maharashtra')),
              DataCell(Text('32.94244917483856')),
            ]),
            DataRow(cells: [
              DataCell(Text('17')),
              DataCell(Text('Gujarat')),
              DataCell(Text('32.3509681372549')),
            ]),
            DataRow(cells: [
              DataCell(Text('18')),
              DataCell(Text('West Bengal')),
              DataCell(Text('31.71666666666667')),
            ]),
            DataRow(cells: [
              DataCell(Text('19')),
              DataCell(Text('Assam')),
              DataCell(Text('30.300211549456833')),
            ]),
            DataRow(cells: [
              DataCell(Text('20')),
              DataCell(Text('Manipur')),
              DataCell(Text('30.151466666666668')),
            ]),
            DataRow(cells: [
              DataCell(Text('21')),
              DataCell(Text('Punjab')),
              DataCell(Text('29.269351385390426')),
            ]),
            DataRow(cells: [
              DataCell(Text('22')),
              DataCell(Text('Nagaland')),
              DataCell(Text('28.472288135593228')),
            ]),
            DataRow(cells: [
              DataCell(Text('23')),
              DataCell(Text('Bihar')),
              DataCell(Text('28.150366365397026')),
            ]),
            DataRow(cells: [
              DataCell(Text('24')),
              DataCell(Text('Mizoram')),
              DataCell(Text('27.153023255813952')),
            ]),
            DataRow(cells: [
              DataCell(Text('25')),
              DataCell(Text('Uttar Pradesh')),
              DataCell(Text('24.44670930070902')),
            ]),
            DataRow(cells: [
              DataCell(Text('26')),
              DataCell(Text('Arunachal Pradesh')),
              DataCell(Text('23.005141562853908')),
            ]),
            DataRow(cells: [
              DataCell(Text('27')),
              DataCell(Text('Madhya Pradesh')),
              DataCell(Text('16.123899337748345')),
            ]),
          ],
        ),
      ])),
    );
  }
}
