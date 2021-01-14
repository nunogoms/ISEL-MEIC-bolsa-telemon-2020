import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/data/model/exams/exam.dart';

class Chart extends StatelessWidget {
  final Exam exam;
  final List<SensorValue> _data;

  Chart(this.exam) : _data = exam.getVisualValues();

  List<charts.Series<SensorValue, int>> _createData() {
    return [
      charts.Series<SensorValue, int>(
        id: 'Values_chart',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (SensorValue sensorValue, __) => sensorValue.timeInMillis,
        domainLowerBoundFn: (_, __) => _data.last.timeInMillis,
        domainUpperBoundFn: (_, __) => _data.first.timeInMillis,
        measureFn: (SensorValue sensorValue, _) => sensorValue.value,
        measureUpperBoundFn: (__, _) => exam.sensor.sensorDataInfo.maxValue,
        measureLowerBoundFn: (__, _) => exam.sensor.sensorDataInfo.minValue,
        data: _data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(_createData(),
        behaviors: [
          charts.ChartTitle(exam.independentUnit,
              behaviorPosition: charts.BehaviorPosition.bottom),
          charts.ChartTitle(exam.sensor.technicalInfo.measurementUnit,
              behaviorPosition: charts.BehaviorPosition.start),
        ],
        animate: false,
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
        ),
        domainAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false,dataIsInWholeNumbers: true),
        ));
  }
}
