import 'dart:math';

class UsernameGenerator {
  final String fullName;
  final DateTime dob;

  UsernameGenerator({
    required this.fullName,
    required this.dob,
  });

  List<String> generateUsernames({required String additionalValue}) {
    final names = fullName.split(' ').where((name) => name.isNotEmpty).toList();
    final firstName = names.isNotEmpty
        ? names.first.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
        : 'user';
    final lastName = names.length > 1
        ? names.last.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
        : '';
    final year =
        dob.year.toString().substring(2); // Using last two digits of the year
    final month = dob.month.toString().padLeft(2, '0');
    final day = dob.day.toString().padLeft(2, '0');
    final additional =
        additionalValue.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    final random = Random();
    final styles = <String>[];

    for (var i = 0; i < 50; i++) {
      final style = _mutateUsername(
          firstName, lastName, year, month, day, additional, random);
      if (style.length >= 5 && style.length < 14) {
        styles.add(style);
      }
    }

    styles.shuffle();
    return styles.take(10).toList();
  }

  String _mutateUsername(String firstName, String lastName, String year,
      String month, String day, String additional, Random random) {
    final mutations = [
      _combineUnique(firstName, lastName),
      _combineUnique(firstName, year),
      _combineUnique(lastName, year),
      _combineUnique(firstName, month, day),
      if (firstName.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), lastName, year),
      _combineUnique(firstName, additional),
      _combineUnique(lastName, additional),
      _combineUnique(additional, year),
      _combineUnique(firstName, '_', lastName),
      _combineUnique(firstName, '_', year),
      _combineUnique(lastName, '_', year),
      _combineUnique(firstName, '.', lastName),
      _combineUnique(firstName, '.', year),
      _combineUnique(lastName, '.', year),
      _combineUnique(additional, '.', year),
      if (firstName.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), '_', lastName, month),
      if (firstName.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), '.', lastName, day),
      _combineUnique(additional, month, day),
      if (additional.isNotEmpty)
        _combineUnique(firstName, '_', additional.substring(0, 1), year),
      if (additional.isNotEmpty)
        _combineUnique(lastName, '_', additional.substring(0, 1), year),
      _combineUnique(firstName, lastName, day),
      if (additional.isNotEmpty)
        _combineUnique(firstName, additional.substring(0, 1)),
      if (firstName.isNotEmpty && lastName.isNotEmpty)
        _combineUnique(
            firstName.substring(0, 1), lastName.substring(0, 1), year),
      if (additional.isNotEmpty)
        _combineUnique(additional, firstName.substring(0, 1)),
      if (firstName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), '_', lastName, additional),
      _combineUnique(firstName, lastName, additional),
      if (firstName.isNotEmpty && lastName.isNotEmpty)
        _combineUnique(
            firstName.substring(0, 1), lastName.substring(0, 1), month),
      _combineUnique(firstName, additional, year),
      _combineUnique(firstName, lastName, month),
      _combineUnique(firstName, additional, day),
      _combineUnique(firstName, additional, month),
      if (lastName.isNotEmpty)
        _combineUnique(lastName.substring(0, 1), '_', firstName, year),
      _combineUnique(additional, lastName, year),
      if (lastName.isNotEmpty)
        _combineUnique(lastName.substring(0, 1), '_', firstName, day),
      _combineUnique(additional, firstName, year),
      if (lastName.isNotEmpty)
        _combineUnique(lastName.substring(0, 1), firstName, year),
      _combineUnique(firstName, lastName, year),
      _combineUnique(lastName, firstName, year),
      if (firstName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), '_', additional, year),
      _combineUnique(firstName, year, additional),
      if (lastName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(lastName.substring(0, 1), '_', additional, day),
      if (firstName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), '.', additional, year),
      if (firstName.isNotEmpty && lastName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(
            firstName.substring(0, 1), lastName, additional.substring(0, 1)),
      if (lastName.isNotEmpty && firstName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(lastName.substring(0, 1), firstName, additional, year),
      if (firstName.isNotEmpty && lastName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(firstName.substring(0, 1), lastName, year,
            additional.substring(0, 1)),
      if (additional.isNotEmpty && firstName.isNotEmpty)
        _combineUnique(additional, year, firstName.substring(0, 1)),
      _combineUnique(firstName, month, additional),
      if (lastName.isNotEmpty && additional.isNotEmpty)
        _combineUnique(lastName.substring(0, 1), additional, year),
    ];

    return mutations[random.nextInt(mutations.length)];
  }

  String _combineUnique(String a, String b, [String? c, String? d]) {
    final combined = '$a$b${c ?? ''}${d ?? ''}';
    final seen = <String>{};
    return combined.split('').where((char) => seen.add(char)).join();
  }
}
//---check the generated usernames
// void main() {
//   final generator = UsernameGenerator(
//     fullName: 'J', // Test with a single letter name
//     dob: DateTime(1990, 5, 23),
//   );

//   final usernames = generator.generateUsernames(
//     additionalValue: 'Johnny',
//   );
//   print(usernames);
// }
