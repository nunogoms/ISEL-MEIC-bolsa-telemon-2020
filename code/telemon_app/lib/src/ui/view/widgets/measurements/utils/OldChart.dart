import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/data/model/exams/exam.dart';
import 'package:telemon_app/src/ui/view/widgets/measurements/utils/GraphUnits.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

class OldChart extends StatefulWidget {
  final Exam exam;
  final ExamSettings examSettings;
  final List<SensorValue> _data;

  OldChart(this.exam, this.examSettings) : _data = exam.getVisualValues();

  @override
  _OldChartState createState() => _OldChartState();
}

class _OldChartState extends State<OldChart> {

  List<charts.Series<SensorValue, int>> _createData() {
    return [//TODO get a thinner line, more on par with medical graphs
      charts.Series<SensorValue, int>(
        id: 'Values_chart',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (SensorValue sensorValue, __) => widget._data.indexOf(sensorValue),
        domainLowerBoundFn: (_, __) => 0,//Time starts at 0
        domainUpperBoundFn: (_, __) => widget.examSettings.secondsToShow * 1000, //TODO better way of converting to milliseconds
        measureFn: (SensorValue sensorValue, _) => sensorValue.value,
        measureUpperBoundFn: (__, _) => widget.exam.sensor.sensorDataInfo.maxValue,
        measureLowerBoundFn: (__, _) => widget.exam.sensor.sensorDataInfo.minValue,
        data: widget._data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(_createData(),
        behaviors: [
          charts.ChartTitle(GraphUnits.independentUnit,
              behaviorPosition: charts.BehaviorPosition.bottom),
          charts.ChartTitle(widget.exam.sensor.technicalInfo.measurementUnit,
              behaviorPosition: charts.BehaviorPosition.start),
        ],
        animate: false,
        primaryMeasureAxis: charts.NumericAxisSpec(
          //Line below removes the grey lines and adds a vertical on the Y axis
          //renderSpec: new charts.SmallTickRendererSpec(),
          tickProviderSpec: charts.StaticNumericTickProviderSpec(
              getYValuesList()),
        ),
        domainAxis: charts.NumericAxisSpec(
          tickProviderSpec: charts.StaticNumericTickProviderSpec(List.generate(
              GraphSettings.xAxisTicks,
              (index) => new charts.TickSpec((widget.examSettings.secondsToShow * 1000 / //TODO better way of converting to milliseconds
                      (GraphSettings.yAxisTicks - 1)) *
                  index))),
        ));
  }

  getYValuesList(){
    var list = List<charts.TickSpec<double>>.generate( //Operation to generate the required values
        GraphSettings.yAxisTicks,
            (index) => new charts.TickSpec(
            widget.exam.sensor.sensorDataInfo.minValue +
                (((widget.exam.sensor.sensorDataInfo.minValue.abs() +
                    widget.exam.sensor.sensorDataInfo.maxValue) /
                    (GraphSettings.yAxisTicks - 1)) *
                    index)));
    return list;
  }
}
