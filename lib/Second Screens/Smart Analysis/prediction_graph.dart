import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class PredictionGraph extends StatefulWidget {
  PredictionGraph({Key key}) : super(key: key);
  @override
  _PredictionGraphState createState() => _PredictionGraphState();
}

class ChartData {
        ChartData(this.x, this.y, this.y1, this.y2);
        final String x;
        final double y;
        final double y1;
        final double y2;
      }

class _PredictionGraphState extends State<PredictionGraph> {
  @override
  Widget build(BuildContext context) {
        final List<ChartData> chartData = <ChartData>[
           ChartData('2021', 81, 78, 51),
           ChartData('2020', 70, 59, 57),
           ChartData('2019', 64, 53, 42),
           ChartData('2018', 57, 41, 38),
        ];
        return Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
            body: Center(
                child: Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y
                            ),
                            ColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y1
                            ),
                            ColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y2
                            )
                        ]
                    )
                )
            )
        );
    }

     
}