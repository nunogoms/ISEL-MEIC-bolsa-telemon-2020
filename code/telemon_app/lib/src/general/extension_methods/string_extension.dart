
extension StringExtension on String {
  get addTwoDots => this + " : ";
  get addSecondsAndTwoDots => this + " (s)".addTwoDots;
}