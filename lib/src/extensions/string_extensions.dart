/// A simple placeholder that can be used to search all the hardcoded strings
/// in the code (useful to identify strings that need to be localized).
extension StringExtensions on String {
  String get hardcoded => this;

  String get toJsonKey {
    return replaceAllMapped(RegExp(r'(?<=[a-z])[A-Z]'),
        (Match m) => '_${m.group(0)!.toLowerCase()}');
  }
}
