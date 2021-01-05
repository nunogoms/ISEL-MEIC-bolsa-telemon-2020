import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/model/device/isensor.dart';

class Chart extends StatelessWidget {
  final List<SensorValue> _data;
  final ISensor sensor;

  Chart(this._data, this.sensor);

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart([
      charts.Series<SensorValue, DateTime>(
        id: 'Values_chart',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (SensorValue values, _) => values.time,
        measureFn: (SensorValue values, _) => values.value,
        measureUpperBoundFn: (__, _) => sensor.sensorInfo.maxValue,
        measureLowerBoundFn: (__, _) => sensor.sensorInfo.minValue,
        data: _data,
      )
    ],
        behaviors: [
          charts.ChartTitle(sensor.measurementUnit,
              behaviorPosition: charts.BehaviorPosition.start)
        ],
        animate: false,
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
        ),
        domainAxis: new charts.DateTimeAxisSpec(
            renderSpec: new charts.NoneRenderSpec()
        )
    );
  }
}
