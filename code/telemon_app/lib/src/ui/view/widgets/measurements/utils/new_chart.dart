import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/data/model/exams/exam.dart';

class NewChart extends StatelessWidget {
  final Exam exam;
  final List<SensorValue> _data = List<SensorValue>();

  NewChart(this.exam) {
    exam.getVisualValues().forEach((element) => _data.add(element));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: LineChart(LineChartData(
      lineBarsData: [getDataGraph()],
      maxY: exam.sensor.sensorDataInfo.maxValue,
      minY: exam.sensor.sensorDataInfo.minValue,
      clipData: FlClipData.horizontal(),
      titlesData: FlTitlesData(bottomTitles: SideTitles(showTitles: false)),
      //TODO adicionar tempos
      axisTitleData: FlAxisTitleData(
        leftTitle: AxisTitle(
            showTitle: true,
            titleText: exam.sensor.technicalInfo.measurementUnit),
        bottomTitle:
            AxisTitle(showTitle: true, titleText: exam.independentUnit),
      ),
    )));
  }

  LineChartBarData getDataGraph() {
    if (_data.isEmpty) _data.add(SensorValue(0.0, 0.0));

    return LineChartBarData(
      spots:
          _data.map((e) => FlSpot(e.timeInMillis.toDouble(), e.value)).toList(),
      dotData: FlDotData(
        show: false,
      ),
      barWidth: 0.5,
    );
  }
}
