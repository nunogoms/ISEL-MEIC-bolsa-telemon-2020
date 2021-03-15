import 'dart:io';
import 'package:telemon_app/src/data/model/measurements/exam.dart';
import 'package:telemon_app/src/data/services/file_service/file_handler.dart';

class ExamFileHandler extends FileHandler<Exam> {
  ExamFileHandler() : super();

  @override
  void writeFile(Exam exam) async {
    final file = await localFile;
    return await file
        .writeAsString("Exam Type : ${"//TODO"}\n",
            mode: FileMode.append)
        .then((_) => file.writeAsString(
            "Start Date : ${exam.startingDatetime.millisecondsSinceEpoch}\n",
            mode: FileMode.append))
        .then((_) => file.writeAsString(
            "UnitY : ${exam.sensor.technicalInfo.measurementUnit}\n",
            mode: FileMode.append))
        .then((_) => file.writeAsString("Duration : ${exam.duration}\n",
            mode: FileMode.append))
        .then((value) => file.writeAsString(
            "\n${exam.independentUnit},${exam.sensor.technicalInfo.measurementUnit}\n",
            mode: FileMode.append))
        .then((_) => exam.getAllValues().forEach(
            (e) => file.writeAsStringSync("${e.timeInMillis},${e.value},\n", mode: FileMode.append)));
  }
}
