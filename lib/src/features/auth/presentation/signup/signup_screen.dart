import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/features/auth/presentation/signup/pulse_signup_page.dart';
import 'package:pulse/src/routing/app_routes.dart';
import 'package:pulse/src/utils/app_themes.dart';

class SignUpNameScreen extends ConsumerStatefulWidget {
  const SignUpNameScreen({super.key});

  @override
  ConsumerState<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends ConsumerState<SignUpNameScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PulseSignupPage(
      title: 'name_title',
      subtitle: 'name_subtitle',
      inputLabel: 'full_name',
      inputHint: 'name_hint',
      controller: _nameController,
      onPressed: () {
        context.pushNamed(AppRoute.signUpPassword.name);
      },
    );
  }
}

//--------------------------------------SignUpPasswordScreen--------------------------------------
class SignUpPasswordScreen extends StatefulWidget {
  const SignUpPasswordScreen({super.key});

  @override
  State<SignUpPasswordScreen> createState() => _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
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
      confirmController: _passwordController,
      onPressed: () {
        context.pushNamed(AppRoute.signUpUsername.name);
      },
    );
  }
}

//--------------------------------------SignUpUsernameScreen--------------------------------------
class SignUpUsernameScreen extends StatelessWidget {
  const SignUpUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PulseSignupPage(
      title: 'username_title',
      subtitle: 'username_subtitle',
      inputLabel: 'username',
      inputHint: 'username_hint',
      controller: TextEditingController(),
      onPressed: () {
        context.pushNamed(AppRoute.signUpBirthDate.name);
      },
    );
  }
}

class SignUpBirthDateScreen extends StatelessWidget {
  const SignUpBirthDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PulseSignupPage(
      title: 'birthday_title',
      subtitle: 'birthday_subtitle',
      inputLabel: 'birthday',
      inputHint: 'birthday_hint',
      controller: TextEditingController(),
      onPressed: () {
        context.pushNamed(AppRoute.signUpMobileNumber.name);
      },
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
