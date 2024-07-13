import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_repository.g.dart';

// * Repository for onboarding checking and setting
class OnboardingRepository {
  final SharedPreferences sharedPreference;
  OnboardingRepository({required this.sharedPreference});
  static const String onboardingKey = 'onboardingComplete';
// * Set onboarding as complete
  Future<void> setOnboardingComplete() async {
    await sharedPreference.setBool(onboardingKey, true);
  }

// * Check if onboarding is complete
  bool isOnboardingComplete() {
    return sharedPreference.getBool(onboardingKey) ?? false;
  }
}

@Riverpod(keepAlive: true)
Future<OnboardingRepository> onboardingRepository(
    OnboardingRepositoryRef ref) async {
  return OnboardingRepository(
      sharedPreference: await SharedPreferences.getInstance());
}
