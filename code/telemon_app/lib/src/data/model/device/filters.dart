
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';

abstract class Filter {
  final double sampleFrequency;
  late final int numTaps ;


  Filter(this.sampleFrequency, int order){
    numTaps = order + 1;
  }


  /// This method will return the specific filter implementation that better suits each sensor,
  /// might be low-pass ,band-pass, or other. See filters.dart file for all filters
  abstract final Array filterCoefficients ;
}

class BandPassFilter extends Filter {
  final double lowCutOff;
  final double highCutOff;
  BandPassFilter({required double sampleFrequency,required this.lowCutOff ,required this.highCutOff, int order=11 }) : super(sampleFrequency, order);

  @override
  Array get filterCoefficients => firwin(this.numTaps, Array([lowCutOff,highCutOff]),pass_zero: false,fs: sampleFrequency);
}

class LowPassFilter extends Filter {
  final double highCutOff;
  LowPassFilter({required double sampleFrequency,required this.highCutOff,int order=11  }) : super(sampleFrequency, order);

  @override
  Array get filterCoefficients => firwin(this.numTaps, Array([highCutOff]),fs: sampleFrequency);
}