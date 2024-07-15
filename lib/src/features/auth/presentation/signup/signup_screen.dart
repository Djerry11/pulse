import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/routing/app_routes.dart';

class SignUpNameScreen extends StatelessWidget {
  const SignUpNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.signUpPassword.name),
      ),
      body: const Center(child: Text('Sign Up Name Screen')),
    );
  }
}

class SignUpPasswordScreen extends StatelessWidget {
  const SignUpPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.signUpUsername.name),
      ),
      body: const Center(child: Text('Sign Up Password Screen')),
    );
  }
}

class SignUpUsernameScreen extends StatelessWidget {
  const SignUpUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.signUpMobileNumber.name),
      ),
      body: const Center(child: Text('Sign Up Username Screen')),
    );
  }
}

class SignUpMobileNumberScreen extends StatelessWidget {
  const SignUpMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.signUpConfirmation.name),
      ),
      body: const Center(child: Text('Sign Up Mobile Number Screen')),
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
