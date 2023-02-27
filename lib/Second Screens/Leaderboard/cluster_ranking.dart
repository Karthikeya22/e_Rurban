import 'package:flutter/material.dart';

class ClusterRanking extends StatefulWidget {
  const ClusterRanking({Key key}) : super(key: key);
  @override
  _ClusterRankingState createState() => _ClusterRankingState();
}

class _ClusterRankingState extends State<ClusterRanking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(children: <Widget>[
            Center(
                child: Text(
              'Clusterwise Ranking',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Rank',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Cluster Rep',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Radhakuchi')),
                  DataCell(Text('Barpeta, Assam')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Majar Char')),
                  DataCell(Text('Barpeta, Assam')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Guhna')),
                  DataCell(Text('Sonipat, Haryana')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('Tekla Chuti')),
                  DataCell(Text('Barpeta, Assam')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('Bampara')),
                  DataCell(Text('Barpeta, Assam')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6')),
                  DataCell(Text('Jamer Kur')),
                  DataCell(Text('Barpeta, Assam')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7')),
                  DataCell(Text('Adupur')),
                  DataCell(Text('Palwal, Haryana')),
                ]),
                DataRow(cells: [
                  DataCell(Text('8')),
                  DataCell(Text('New Nonglamin')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('9')),
                  DataCell(Text('Lumcharatoh')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Bagma (Part)')),
                  DataCell(Text('Dhalai, Tripura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('11')),
                  DataCell(Text('Samatan')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('12')),
                  DataCell(Text('Lum Tongseng')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('13')),
                  DataCell(Text('Thuruk')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('14')),
                  DataCell(Text('Dakshin Chandrapur')),
                  DataCell(Text('Dhalai, Tripura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Kaizakham')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('16')),
                  DataCell(Text('Tympiah Kasu')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('17')),
                  DataCell(Text('Seijronghong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('18')),
                  DataCell(Text('Maw Shillong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('19')),
                  DataCell(Text('Latyrke')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20')),
                  DataCell(Text('Nongkharai')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('21')),
                  DataCell(Text('Tongkiad')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('22')),
                  DataCell(Text('Jalaphet Bri Sumer')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('23')),
                  DataCell(Text('Madan Tyrpait')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('24')),
                  DataCell(Text('Mulang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('25')),
                  DataCell(Text('Biar')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('26')),
                  DataCell(Text('Dona Umbluh')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('27')),
                  DataCell(Text('Situng')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('28')),
                  DataCell(Text('Thangthring')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('29')),
                  DataCell(Text('Umshong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('30')),
                  DataCell(Text('Madansynrang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('31')),
                  DataCell(Text('Lumlakhiat')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('32')),
                  DataCell(Text('Mookhain')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('33')),
                  DataCell(Text('Mihmyntdu')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('34')),
                  DataCell(Text('Dein Shalalu')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('35')),
                  DataCell(Text('Tarangblang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('36')),
                  DataCell(Text('Umkyrpong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('37')),
                  DataCell(Text('Pynthorlangtein')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('38')),
                  DataCell(Text('Lakasein')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('39')),
                  DataCell(Text('Mynso')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('40')),
                  DataCell(Text('Pdien Wah-Khynriam')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('41')),
                  DataCell(Text('Mookjat')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('42')),
                  DataCell(Text('Latanai')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('43')),
                  DataCell(Text('Amlako')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('44')),
                  DataCell(Text('Borghat')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('45')),
                  DataCell(Text('Mowkaiaw')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('46')),
                  DataCell(Text('Moolyngkdein')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('47')),
                  DataCell(Text('Thang Skai')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('48')),
                  DataCell(Text('Musiang Lamare (Old)')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('49')),
                  DataCell(Text('Myntkung')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('50')),
                  DataCell(Text('Iangkar')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('51')),
                  DataCell(Text('Mutong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('52')),
                  DataCell(Text('Lum Soskie')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('53')),
                  DataCell(Text('Lurniang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('54')),
                  DataCell(Text('Mukoiram')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('55')),
                  DataCell(Text('Pdengryngkoh')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('56')),
                  DataCell(Text('Umsalang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('57')),
                  DataCell(Text('Shken Talang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('58')),
                  DataCell(Text('Tangnub')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('59')),
                  DataCell(Text('Kuliang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('60')),
                  DataCell(Text('Twah - u - Sdiah')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('61')),
                  DataCell(Text('Lad Lakadong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('62')),
                  DataCell(Text('Tum-Tum')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('63')),
                  DataCell(Text('Bhain')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('64')),
                  DataCell(Text('Sutnga')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('65')),
                  DataCell(Text('Lama')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('66')),
                  DataCell(Text('Amkoi')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('67')),
                  DataCell(Text('Lungmaicham')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('68')),
                  DataCell(Text('Sahsniang B')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('69')),
                  DataCell(Text('Pasadwar')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('70')),
                  DataCell(Text('Purba Pillak')),
                  DataCell(Text('Dhalai, Tripura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('71')),
                  DataCell(Text('Madanpohkseh')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('72')),
                  DataCell(Text('Khonglah')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('73')),
                  DataCell(Text('Shangpung Pohshnong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('74')),
                  DataCell(Text('Rachai')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('75')),
                  DataCell(Text('Bapung Skur')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('76')),
                  DataCell(Text('Lumstong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('77')),
                  DataCell(Text('Rtiang Sanphew')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('78')),
                  DataCell(Text('Mookyndeng')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('79')),
                  DataCell(Text('Mooker')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('80')),
                  DataCell(Text('Nongrimbambthong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('81')),
                  DataCell(Text('Jalaphet Bri Sutnga')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('82')),
                  DataCell(Text('Sohkha Mission')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('83')),
                  DataCell(Text('Tuituk')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('84')),
                  DataCell(Text('Hartale')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('85')),
                  DataCell(Text('Tlangpui')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('86')),
                  DataCell(Text('Amsyrwai')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('87')),
                  DataCell(Text('Umlaphiah')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('88')),
                  DataCell(Text('Amlarang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('89')),
                  DataCell(Text('Amtaniut')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('90')),
                  DataCell(Text('Khliehtyrshi')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('91')),
                  DataCell(Text('ATS')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('92')),
                  DataCell(Text('Myntler')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('93')),
                  DataCell(Text('Shet Jahadem')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('94')),
                  DataCell(Text('Phrang Prang')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('95')),
                  DataCell(Text('Moo Pala')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('96')),
                  DataCell(Text('Amshipai')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('97')),
                  DataCell(Text('Khaidong')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('98')),
                  DataCell(Text('Iapmala')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
                DataRow(cells: [
                  DataCell(Text('99')),
                  DataCell(Text('Khliehumbuit')),
                  DataCell(Text('East Jaintia Hills, Meghalaya')),
                ]),
              ],
            ),
          ])),
    );
  }
    }
