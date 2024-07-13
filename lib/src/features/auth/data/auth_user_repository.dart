import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pulse/src/features/auth/domain/auth_model.dart';
import 'package:pulse/src/features/profile/data/user_repository.dart';
import 'package:pulse/src/features/profile/domain/models/user_model.dart';
import 'package:pulse/src/features/shared/helpers/async_call_helper.dart';
import 'package:pulse/src/features/shared/helpers/reference_helper.dart';
import 'package:pulse/src/features/shared/models/error_model.dart';
import 'package:pulse/src/utils/functional_either.dart';

abstract class PulseAuthRepository {
  Future<Either<PulseUser, PulseError>> signUpWithEmailAndPassword({
    required final PulseUser user,
    required final String email,
    required final String password,
  });

  Future<Either<bool, PulseError>> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  });

  Future<Either<bool, PulseError>> sendPasswordResetEmail({
    required final String email,
  });

  Future<Either<bool, PulseError>> signInWithGoogle();

  Future<Either<bool, PulseError>> signInWithFacebook();

  Future<Either<bool, PulseError>> signOut({
    final bool signOutGoogleLogin = false,
    final bool signOutFacebookLogin = false,
  });

  Stream<PulseAuthUser?> get authUser;
}

class PulseAuthRepositoryImpl extends PulseAuthRepository {
  PulseAuthRepositoryImpl({
    required final PulseUserRepository PulseUserRepository,
  }) : _PulseUserRepository = PulseUserRepository;

  final PulseUserRepository _PulseUserRepository;
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _facebookSignIn = FacebookAuth.instance;

  @override
  Stream<PeamanAuthUser?> get authUser => _auth
      .authStateChanges()
      .map((e) => e == null ? null : PeamanAuthUser(uid: e.uid));

  @override
  Future<Either<bool, PulseError>> sendPasswordResetEmail({
    required String email,
  }) {
    return runAsyncCall(
      future: () async {
        await _auth.sendPasswordResetEmail(email: email);
        return const Success(true);
      },
      onError: (e) {
        return Failure(e);
      },
    );
  }

  @override
  Future<Either<bool, PulseError>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return runAsyncCall(
      future: () async {
        final result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (result.user == null) {
          throw Exception('User from firestore was null');
        }
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> signInWithFacebook() {
    return runAsyncCall(
      future: () async {
        final account = await _facebookSignIn.login();

        if (account.status != LoginStatus.success) {
          throw Exception('${account.status}');
        }

        final accessToken = account.accessToken;
        if (accessToken == null) throw Exception('Access Token is null');

        final cred = FacebookAuthProvider.credential(accessToken.token);
        final result = await _auth.signInWithCredential(cred);

        final user = result.user;
        if (user == null) throw Exception('AuthUser is null');

        final userRef = PulseReferenceHelper.usersCol.doc(user.uid);
        final userSnap = await userRef.get();

        final registered = userSnap.exists;
        if (!registered) {
          final appUser = PulseUser(
            uid: user.uid,
            email: user.email,
            createdAt: user.metadata.creationTime?.millisecondsSinceEpoch,
          );
          final createUserResult =
              await _PulseUserRepository.createUser(user: appUser);
          if (createUserResult.isFailure) throw createUserResult.failure;
        }

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> signInWithGoogle() {
    return runAsyncCall(
      future: () async {
        final account = await _googleSignIn.signIn();

        if (account == null) throw Exception('No account was selected');

        final tokens = await account.authentication;
        final cred = GoogleAuthProvider.credential(
          idToken: tokens.idToken,
          accessToken: tokens.accessToken,
        );

        final result = await _auth.signInWithCredential(cred);

        final user = result.user;
        if (user == null) throw Exception('AuthUser is null');

        final userRef = PulseReferenceHelper.usersCol.doc(user.uid);
        final userSnap = await userRef.get();
        final registered = userSnap.exists;

        if (!registered) {
          final appUser = PulseUser(
            uid: user.uid,
            email: user.email,
            createdAt: user.metadata.creationTime?.millisecondsSinceEpoch,
          );
          final createUserResult =
              await _PulseUserRepository.createUser(user: appUser);
          if (createUserResult.isFailure) throw createUserResult.failure;
        }

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> signOut({
    bool signOutGoogleLogin = false,
    bool signOutFacebookLogin = false,
  }) {
    return runAsyncCall(
      future: () async {
        await Future.wait([
          _auth.signOut(),
          if (signOutGoogleLogin) _googleSignIn.signOut(),
          if (signOutFacebookLogin) _facebookSignIn.logOut(),
        ]);

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<PulseUser, PulseError>> signUpWithEmailAndPassword({
    required PulseUser user,
    required String email,
    required String password,
  }) {
    return runAsyncCall(
      future: () async {
        final result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (result.user == null) throw Exception('AuthUser is null');

        final user0 = user.copyWith(
          uid: result.user?.uid,
          createdAt: result.user?.metadata.creationTime?.millisecondsSinceEpoch,
        );

        final createUserResult = await _PulseUserRepository.createUser(
          user: user0,
        );
        if (createUserResult.isFailure) throw createUserResult.failure;

        return Success(user0);
      },
      onError: Failure.new,
    );
  }
}
