import 'package:bitalino/bitalino.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';

abstract class Filter {
  final Frequency sampleFrequency;
  late final int numTaps;

  Filter(this.sampleFrequency, int order) {
    numTaps = order + 1;
  }

  /// This method will return the specific filter implementation that better suits each sensor,
  /// might be low-pass ,band-pass, or other. See filters.dart file for all filters
  abstract final Array filterCoefficients;
}

class BandPassFilter extends Filter {
  final double lowCutOff;
  final double highCutOff;
  final bool scale;

  BandPassFilter({required Frequency sampleFrequency,
    required this.lowCutOff,
    required this.highCutOff,
    int order = 11,
    this.scale = false})
      : super(sampleFrequency, order);

  @override
  Array get filterCoefficients =>
      firwin(this.numTaps, Array([lowCutOff, highCutOff]),
          pass_zero: false, fs: serializeFrequency(sampleFrequency).toDouble(), scale: scale);
}

class LowPassFilter extends Filter {
  final double highCutOff;

  LowPassFilter({required Frequency sampleFrequency,
    required this.highCutOff,
    int order = 11})
      : super(sampleFrequency, order);

  @override
  Array get filterCoefficients =>
      firwin(this.numTaps, Array([highCutOff]), fs:serializeFrequency(sampleFrequency).toDouble());
}