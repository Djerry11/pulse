import 'package:pulse/src/extensions/widget_extensions.dart';
import 'package:pulse/src/features/profile/domain/enums/gender_type.dart';
import 'package:pulse/src/features/profile/domain/models/user_model.dart';
import 'package:pulse/src/utils/username_generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_user_notifier.g.dart';

@riverpod
class SignupUserNotifier extends _$SignupUserNotifier {
  final usernameDb = <String>[
    'john_doe',
    'john1',
    'doejohn'
        'john_doe1',
    'johndoe1',
    'john_doe2',
    'johndoe2',
    'john_doe3',
    'johndoe3',
    'john_doe4',
    'johndoe4',
    'john_doe5',
    'johndoe5',
    'john_doe6',
    'johndoe6',
    'john_doe7',
    'johndoe7',
    'john_doe8',
    'johndoe8',
    'john_doe9',
    'johndoe9',
  ];
  @override
  PulseUser build() {
    // Initial state can be an empty PulseUser or a default user.
    return const PulseUser();
  }

  void updateUser(PulseUser user) {
    state = user;
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateDob(DateTime dob) {
    final int dobInt = dob.millisecondsSinceEpoch;
    state = state.copyWith(dob: dobInt);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateGender(PulseGender gender) {
    state = state.copyWith(gender: gender);
  }

  void updateUsername(String usr) {
    state = state.copyWith(userName: usr);
  }

  UsernameGenerator get usernameGenerator => UsernameGenerator(
        fullName: state.name ?? '',
        //dummy date
        dob: state.dob?.toDate ?? DateTime(1990, 1, 1),
      );

  List<String> generateAndGetValidUsernames(String usr) {
    List<String> generatedUsrname =
        usernameGenerator.generateUsernames(additionalValue: usr);
    generatedUsrname.removeWhere((element) => usernameDb.contains(element));
    return generatedUsrname;
  }

  bool isUsernameValid(String usr) {
    return !usernameDb.contains(usr);
  }
}

class AgeValidationNotifier extends Notifier<bool> {
  var dob = DateTime(1990, 1, 1);
  @override
  build() {
    return true;
  }

  void validateAge(int dobInt) {
    final DateTime dob = dobInt.toDate;
    final int age = DateTime.now().year - dob.year;
    if (age < 13) {
      state = false;
    } else {
      _saveBirthDate(dobInt.toDate);
      state = true;
    }
  }

  void _saveBirthDate(DateTime db) {
    dob = db;
  }

  DateTime get getDob => dob;
}

final ageValidationProvider =
    NotifierProvider<AgeValidationNotifier, bool>(AgeValidationNotifier.new);

//-----