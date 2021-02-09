import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/data/model/exams/exam.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/ui/view/widgets/measurements/utils/OldChart.dart';
import 'package:telemon_app/src/ui/viewmodels/exam_viewmodel.dart';

class SensorGraph extends StatefulWidget {
  final ISensor sensorDevice;

  const SensorGraph({Key key, this.sensorDevice}) : super(key: key);

  @override
  _SensorGraph createState() => _SensorGraph();
}

class _SensorGraph extends State<SensorGraph> {
  GlobalKey<ScaffoldState> _sensorKey = GlobalKey<ScaffoldState>();

  Widget _getIconText(ExamViewModel sensorVM) {
    Widget toRet = null;
    switch (sensorVM.examState) {
      case ExamState.INIT:
        toRet = Text(l10n(context).start);
        break;
      case ExamState.MEASURING:
        toRet = Text(l10n(context).stop);
        break;
      case ExamState.FINISHED:
        toRet = Text(l10n(context).reset);
    }
    return toRet;
  }

  @override
  Widget build(BuildContext context) {
    ExamViewModel examVM = Provider.of<ExamViewModel>(context);

    return Column(
      key: _sensorKey,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 5, top: 20, right: 10, bottom: 10),
            child: OldChart(examVM.exams.last, examVM.examSettings),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Row(children: [
                Expanded(
                  child: RaisedButton(
                      onPressed: () async {
                        switch (examVM.examState) {
                          case ExamState.INIT:
                            await examVM.startMeasuring();
                            break;
                          case ExamState.MEASURING:
                            await examVM.stopMeasuring();
                            break;
                          case ExamState.FINISHED:
                            await examVM.resetMeasuring();
                        }
                      },
                      child: _getIconText(examVM)),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: examVM.examState == ExamState.FINISHED
                      ? RaisedButton(
                          onPressed: () async {
                            if (examVM.examState == ExamState.FINISHED)
                              return await examVM.saveExam();
                          },
                          child: Text(l10n(context).save),
                        )
                      : Text(""),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
