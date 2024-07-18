class UsernameValidator {
  // Regular expression pattern for valid Instagram usernames
  static final RegExp _usernameRegExp =
      RegExp(r'^[a-zA-Z0-9](?!.*[_.]{2})[a-zA-Z0-9._]{3,12}[a-zA-Z0-9]$');

  // Method to check if a given username is valid
  static bool isValidUsername(String username) {
    return _usernameRegExp.hasMatch(username);
  }

  // Method to provide feedback on why a username is invalid
  static String validateUsername(String username) {
    if (username.length < 5 || username.length > 14) {
      return 'Username must be between 5 and 14 characters long.';
    }
    if (!_usernameRegExp.hasMatch(username)) {
      return 'Username can only contain letters, numbers, periods, and underscores. '
          'It cannot start or end with a period or underscore, and it cannot contain consecutive periods or underscores.';
    }
    return 'Username is valid.';
  }
}

// void main() {
//   final usernames = [
//     'john.doe', // valid
//     'john..doe', // invalid
//     'john_doe_', // invalid
//     '_john_doe', // invalid
//     'john_doe23', // valid
//     'jo', // invalid
//     'john.doe.with.long.name', // invalid
//   ];

//   for (var username in usernames) {
//     print('Checking username: $username');
//     final isValid = UsernameValidator.isValidUsername(username);
//     final feedback = UsernameValidator.validateUsername(username);
//     print('Is valid: $isValid');
//     print('Feedback: $feedback');
//     print('');
//   }
// }
