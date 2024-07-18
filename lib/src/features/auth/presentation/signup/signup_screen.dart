import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/constants/app_colors.dart';
import 'package:pulse/src/extensions/widget_extensions.dart';
import 'package:pulse/src/features/auth/presentation/signup/custom_signup_page.dart';
import 'package:pulse/src/features/auth/presentation/signup/signup_user_notifier.dart';
import 'package:pulse/src/routing/app_routes.dart';
import 'package:pulse/src/utils/username_generator.dart';

class SignUpNameScreen extends ConsumerStatefulWidget {
  const SignUpNameScreen({super.key});

  @override
  ConsumerState<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends ConsumerState<SignUpNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  var name = '';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupUser = ref.watch(signupUserNotifierProvider.notifier);

    return PulseSignupPage(
      title: 'name_title',
      subtitle: 'name_subtitle',
      inputLabel: 'full_name',
      inputHint: 'name_hint',
      controller: _nameController,
      onChanged: (val) {
        name = val;
      },
      onPressed: () {
        context.pushNamed(AppRoute.signUpPassword.name);
        signupUser.updateUsername(name);
      },
    );
  }
}

//--------------------------------------SignUpPasswordScreen--------------------------------------
class SignUpPasswordScreen extends ConsumerStatefulWidget {
  const SignUpPasswordScreen({super.key});

  @override
  ConsumerState<SignUpPasswordScreen> createState() =>
      _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends ConsumerState<SignUpPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PulseSignupPage(
      title: 'password_title',
      subtitle: 'password_subtitle',
      inputLabel: 'password',
      inputHint: 'password_hint',
      inputLabel2: 'confirm_password',
      controller: _passwordController,
      confirmController: _confirmPasswordController,
      onPressed: () {
        context.pushNamed(AppRoute.signUpBirthDate.name);
      },
    );
  }
}

//--------------------------------------SignUpUsernameScreen--------------------------------------

class SignUpUsernameScreen extends ConsumerStatefulWidget {
  const SignUpUsernameScreen({super.key});

  @override
  ConsumerState<SignUpUsernameScreen> createState() =>
      _SignUpUsernameScreenState();
}

class _SignUpUsernameScreenState extends ConsumerState<SignUpUsernameScreen> {
  final int minUsernameLength = 5;
  // Text editing controller for username input field
  final TextEditingController _usernameController = TextEditingController();

  // Variables to manage validation state and text value
  var isValidated = false;
  var textValue = '';

  // Widgets for displaying error and extra information
  Widget? errorWidget;
  Widget? extraWidget;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  //-------main build
  @override
  Widget build(BuildContext context) {
    final usernameGenerator = ref.watch(signupUserNotifierProvider.notifier);
    return PulseSignupPage(
      controller: _usernameController,
      title: 'username_title',
      subtitle: 'username_subtitle',
      inputLabel: 'username',
      inputHint: 'username_hint',
      inputTrailing: _usernameController.text.isNotEmpty
          ? isValidated == true
              ? const Icon(Icons.check_circle_outline, color: Colors.green)
              : const Icon(Icons.error_outline, color: Colors.redAccent)
          : null,
      gradientColors: isValidated == true
          ? null
          : [Colors.grey.shade300, Colors.grey.shade400],
      onPressed: () {
        context.pushNamed(AppRoute.signUpMobileNumber.name);
      },
      extraWidget: extraWidget,
      errorWidget: errorWidget,
      isFormValidated: isValidated,
      onChanged: (val) {
        setState(() {
          textValue = val;

          onValueChanged(textValue);
        });
      },
    );
  }

  //------------------------Username not available Error widget --------------------------------------
  Widget? errorWidgetBuilder(String? value) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    if (value!.length < minUsernameLength) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Username must be at least $minUsernameLength characters.',
              style: textStyle!.copyWith(
                color: AppColors.errorRed,
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
          ],
        ),
      );
    } else if (!isValidated) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'The username ',
              style: textStyle!.copyWith(
                color: AppColors.errorRed,
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
            TextSpan(
              text: value,
              style: textStyle.copyWith(
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
            TextSpan(
              text: ' is already taken.',
              style: textStyle.copyWith(
                color: AppColors.errorRed,
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
          ],
        ),
      );
    } else if (isValidated) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'The username ',
              style: textStyle!.copyWith(
                color: Colors.green,
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
            TextSpan(
              text: value,
              style: textStyle.copyWith(
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
            TextSpan(
              text: ' is available.',
              style: textStyle.copyWith(
                color: Colors.green,
                fontSize: textStyle.fontSize!.spMin,
              ),
            ),
          ],
        ),
      );
    } else {
      return null;
    }
  }

  //------------------------Username Suggestion Suggestion widget --------------------------------------
  Widget? suggestionBuilder(String? value) {
    if (value!.length < minUsernameLength) {
      return null;
    }

    final suggestedUsername = ref
        .watch(signupUserNotifierProvider.notifier)
        .generateAndGetValidUsernames(value);
    //  TODO: CHECK IF SUGGESTED USERNAME IS AVAILABLE OR NOT IN THE DATABASE
    //--
    return _usernameSuggestionBox(suggestedUsername);
  }

  //------------------------Username onValueChanged --------------------------------------
  void onValueChanged(String? value) {
    if (value!.length < minUsernameLength) {
      isValidated = false;
    } else {
      isValidated =
          ref.read(signupUserNotifierProvider.notifier).isUsernameValid(value);
    }
    setState(() {
      errorWidget = errorWidgetBuilder(value);
      extraWidget = suggestionBuilder(value);
    });
  }

  // Widget for displaying username suggestions
  Widget _usernameSuggestionBox(List<String> suggestions) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 200.spMin,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: textTheme.headlineLarge!.color!),
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _usernameController.text = suggestions[index];
                textValue = suggestions[index];
                onValueChanged(textValue);
              });
            },
            child: Row(
              children: [
                Text(
                  suggestions[index],
                  style: textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .color!
                        .withOpacity(0.6),
                    fontSize: 18.spMax,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                ),
              ],
            ).pX(12).pT(15),
          );
        },
      ),
    ).pT(20);
  }
}

class SignUpBirthDateScreen extends ConsumerStatefulWidget {
  const SignUpBirthDateScreen({super.key});

  @override
  ConsumerState<SignUpBirthDateScreen> createState() =>
      _SignUpBirthDateScreenState();
}

class _SignUpBirthDateScreenState extends ConsumerState<SignUpBirthDateScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final signupUser = ref.watch(signupUserNotifierProvider.notifier);
    final isAgeValid = ref.watch(ageValidationProvider);

    return PulseSignupPage(
      title: 'birthday_title',
      subtitle: 'birthday_subtitle',
      inputLabel: 'birthday',
      inputHint: 'birthday_hint',
      isFormValidated: isAgeValid,
      controller: _birthdayController,

      //--form
      onChanged: (val) {
        ref.read(ageValidationProvider.notifier).validateAge(int.parse(val));
      },
      //button,
      onPressed: () {
        if (isAgeValid && _birthdayController.text.isNotEmpty) {
          final age = ref.read(ageValidationProvider.notifier).getDob;
          ref.read(signupUserNotifierProvider.notifier).updateDob(age);
          context.pushNamed(AppRoute.signUpUsername.name);
        }
      },
      gradientColors: isAgeValid && _birthdayController.text.isNotEmpty
          ? null
          : AppColors.disabledButtonColors,
      errorWidget: isAgeValid
          ? null
          : const Text('Must be 13 years or older',
              style: TextStyle(
                  color: AppColors.errorRed, fontWeight: FontWeight.bold)),
    );
  }
}

class SignUpMobileNumberScreen extends StatelessWidget {
  const SignUpMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PulseSignupPage(
      title: 'mobile_number_title',
      subtitle: 'mobile_number_subtitle',
      inputLabel: 'mobile_number',
      inputHint: 'mobile_number_hint',
      controller: TextEditingController(),
      onPressed: () {
        context.pushNamed(AppRoute.signUpConfirmation.name);
      },
    );
  }
}

class SignUpConfirmationScreen extends StatelessWidget {
  const SignUpConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.signUpComplete.name),
      ),
      body: const Center(child: Text('Sign Up Confirmation Screen')),
    );
  }
}

class SignUpCompleteScreen extends StatelessWidget {
  const SignUpCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: () => context.go(AppRoute.signUp.name),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.signIn.name),
      ),
      body: const Center(child: Text('Sign Up Complete Screen')),
    );
  }
}
