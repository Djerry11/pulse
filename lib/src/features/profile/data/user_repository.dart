import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pulse/src/constants/firestore_constants.dart';
import 'package:pulse/src/features/profile/domain/enums/online_status.dart';
import 'package:pulse/src/features/profile/domain/models/follow_request_model.dart';
import 'package:pulse/src/features/profile/domain/models/sub_user_model.dart';
import 'package:pulse/src/features/profile/domain/models/user_model.dart';
import 'package:pulse/src/features/shared/helpers/async_call_helper.dart';
import 'package:pulse/src/features/shared/helpers/common_helper.dart';
import 'package:pulse/src/features/shared/helpers/reference_helper.dart';
import 'package:pulse/src/features/shared/models/error_model.dart';
import 'package:pulse/src/features/shared/models/field_model.dart';
import 'package:pulse/src/utils/functional_either.dart';

abstract class PulseUserRepository {
  Future<Either<bool, PulseError>> createUser({
    required final PulseUser user,
  });

  Future<Either<bool, PulseError>> updateUser({
    required final String uid,
    required final List<PulseField> fields,
  });

  Future<Either<bool, PulseError>> deleteUser({
    required final String uid,
  });

  Future<Either<bool, PulseError>> followUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> acceptFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> ignoreFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> cancelFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> followBackUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> unfollowUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> blockUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> unblockUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PulseError>> setUserOnlineStatus({
    required final String uid,
    required final PulseOnlineStatus onlineStatus,
  });

  Future<Either<bool, PulseError>> setIsOnboardingCompleted({
    required final String uid,
    required final bool isOnboardingCompleted,
  });

  Future<Either<List<PulseUser>, PulseError>> getUsers({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseUser>> getUsersStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PulseUser, PulseError>> getSingleUser({
    required final String uid,
  });

  Stream<PulseUser> getSingleUserStream({
    required final String uid,
  });

  Future<Either<List<PulseUser>, PulseError>> getUsersBySearchKey({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseUser>> getUsersBySearchKeyStream({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PulseFollowRequest>, PulseError>>
      getReceivedFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseFollowRequest>> getReceivedFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PulseFollowRequest>, PulseError>> getSentFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseFollowRequest>> getSentFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PulseSubUser>, PulseError>> getFollowers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseSubUser>> getFollowersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PulseSubUser>, PulseError>> getFollowings({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseSubUser>> getFollowingsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PulseSubUser>, PulseError>> getBlockedUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseSubUser>> getBlockedUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PulseSubUser>, PulseError>> getBlockedByUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PulseSubUser>> getBlockedByUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });
}

class PulseUserRepositoryImpl extends PulseUserRepository {
  @override
  Future<Either<bool, PulseError>> acceptFollowRequest({
    required String uid,
    required String friendId,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final receivedRef = PulseReferenceHelper.receivedFollowRequestsCol(
          uid: uid,
        ).doc(friendId);
        final sentRef = PulseReferenceHelper.sentFollowRequestsCol(
          uid: friendId,
        ).doc(uid);

        final futures = <Future>[];

        final receivedFuture = receivedRef.update({
          'is_accepted': true,
          'updated_at': millis,
        });
        futures.add(receivedFuture);

        final sentFuture = sentRef.update({
          'is_accepted': true,
          'updated_at': millis,
        });
        futures.add(sentFuture);

        final addFollowFuture = _addFollowerFollowing(
          uid: uid,
          friendId: friendId,
        );
        futures.add(addFollowFuture);

        await Future.wait(futures);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> blockUser({
    required String uid,
    required String friendId,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final blockedUserRef =
            PulseReferenceHelper.blockedUsersCol(uid: uid).doc(friendId);
        final blockedByUserRef =
            PulseReferenceHelper.blockedByUsersCol(uid: friendId).doc(uid);

        final blockedUser = PulseSubUser(
          uid: friendId,
          createdAt: millis,
        );
        final blockedByUser = PulseSubUser(
          uid: uid,
          createdAt: millis,
        );

        final blockedUserFuture = blockedUserRef.set(
          blockedUser.toJson(),
        );
        final blockedByUserFuture = blockedByUserRef.set(
          blockedByUser.toJson(),
        );

        await Future.wait([
          blockedUserFuture,
          blockedByUserFuture,
        ]);

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> cancelFollowRequest({
    required String uid,
    required String friendId,
  }) {
    return runAsyncCall(
      future: () async {
        final receivedRef = PulseReferenceHelper.receivedFollowRequestsCol(
          uid: friendId,
        ).doc(uid);
        final sentRef = PulseReferenceHelper.sentFollowRequestsCol(
          uid: uid,
        ).doc(friendId);

        final receivedFututre = receivedRef.delete();
        final sentFuture = sentRef.delete();

        await Future.wait([
          receivedFututre,
          sentFuture,
        ]);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> createUser({
    required PulseUser user,
  }) {
    return runAsyncCall(
      future: () async {
        final appUserRef = PulseReferenceHelper.usersCol.doc(user.uid);
        await appUserRef.set({
          ...user.toJson(),
          ...user.extraData,
        });
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> deleteUser({
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> followBackUser({
    required String uid,
    required String friendId,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final receivedRef = PulseReferenceHelper.receivedFollowRequestsCol(
          uid: uid,
        ).doc(friendId);
        final sentRef = PulseReferenceHelper.sentFollowRequestsCol(
          uid: friendId,
        ).doc(uid);

        final friendFollowersRef = PulseReferenceHelper.userFollowersCol(
          uid: friendId,
        ).doc(uid);
        final userFollowingRef = PulseReferenceHelper.userFollowingsCol(
          uid: uid,
        ).doc(friendId);

        final futures = <Future>[];

        final friendFollower = PulseSubUser(
          uid: uid,
          createdAt: millis,
        );
        final userFollowing = PulseSubUser(
          uid: friendId,
          createdAt: millis,
        );

        final friendFollowersFuture = friendFollowersRef.set(
          friendFollower.toJson(),
        );
        futures.add(friendFollowersFuture);

        final userFollowingFuture = userFollowingRef.set(
          userFollowing.toJson(),
        );
        futures.add(userFollowingFuture);

        final addFollowerFollowingFuture = _addFollowerFollowing(
          uid: friendId,
          friendId: uid,
        );
        futures.add(addFollowerFollowingFuture);

        final requestFuture = receivedRef.delete();
        futures.add(requestFuture);

        final sentFuture = sentRef.delete();
        futures.add(sentFuture);

        await Future.wait(futures);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> followUser({
    required String uid,
    required String friendId,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final receivedRef = PulseReferenceHelper.receivedFollowRequestsCol(
          uid: friendId,
        ).doc(uid);
        final sentRef = PulseReferenceHelper.sentFollowRequestsCol(
          uid: uid,
        ).doc(friendId);

        final received = PulseFollowRequest(
          uid: uid,
          createdAt: millis,
        );
        final sent = PulseFollowRequest(
          uid: friendId,
          createdAt: millis,
        );

        final receivedFuture = receivedRef.set(received.toJson());
        final sentFuture = sentRef.set(sent.toJson());

        await Future.wait([
          receivedFuture,
          sentFuture,
        ]);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<PulseSubUser>, PulseError>> getBlockedByUsers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.blockedByUsersCol(uid: uid)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_subUsersFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseSubUser>> getBlockedByUsersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.blockedByUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PulseSubUser>, PulseError>> getBlockedUsers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.blockedUsersCol(uid: uid)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_subUsersFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseSubUser>> getBlockedUsersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.blockedUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PulseSubUser>, PulseError>> getFollowers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.userFollowersCol(uid: uid)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_subUsersFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseSubUser>> getFollowersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.userFollowersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PulseSubUser>, PulseError>> getFollowings({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.userFollowingsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_subUsersFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseSubUser>> getFollowingsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.userFollowingsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PulseFollowRequest>, PulseError>>
      getReceivedFollowRequests({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.receivedFollowRequestsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_followRequestsFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseFollowRequest>> getReceivedFollowRequestsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.receivedFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_followRequestsFromFirestore);
  }

  @override
  Future<Either<List<PulseFollowRequest>, PulseError>> getSentFollowRequests({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.sentFollowRequestsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_followRequestsFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseFollowRequest>> getSentFollowRequestsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.sentFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_followRequestsFromFirestore);
  }

  @override
  Future<Either<PulseUser, PulseError>> getSingleUser({
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final userRef = PulseReferenceHelper.userDoc(uid: uid);
        final userSnap = await userRef.get();
        final userData = userSnap.data();
        if (userData == null) throw Exception('user data is null');
        final user = PulseUser.fromJson(userData);
        return Success(user);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<PulseUser> getSingleUserStream({
    required String uid,
  }) {
    final userRef = PulseReferenceHelper.userDoc(uid: uid);
    return userRef.snapshots().map(_userFromFirestore);
  }

  @override
  Future<Either<List<PulseUser>, PulseError>> getUsers({
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.usersCol
            .where('visibility', isEqualTo: true)
            .orderBy('created_at', descending: true);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_usersFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<PulseUser>, PulseError>> getUsersBySearchKey({
    required String searchKey,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PulseReferenceHelper.usersCol
            .where('visibility', isEqualTo: true)
            .where('search_keys', arrayContains: searchKey);
        final query0 = query?.call(ref) ?? ref;
        final result = await query0.get().then(_usersFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PulseUser>> getUsersBySearchKeyStream({
    required String searchKey,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .where('search_keys', arrayContains: searchKey);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_usersFromFirestore);
  }

  @override
  Stream<List<PulseUser>> getUsersStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    final ref = PulseReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final query0 = query?.call(ref) ?? ref;
    return query0.snapshots().map(_usersFromFirestore);
  }

  @override
  Future<Either<bool, PulseError>> ignoreFollowRequest({
    required String uid,
    required String friendId,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final receivedRef = PulseReferenceHelper.receivedFollowRequestsCol(
          uid: uid,
        ).doc(friendId);
        final sentRef = PulseReferenceHelper.sentFollowRequestsCol(
          uid: friendId,
        ).doc(uid);

        final futures = <Future>[];

        final receivedFuture = receivedRef.update({
          'is_ignored': true,
          'updated_at': millis,
        });
        futures.add(receivedFuture);

        final sentFuture = sentRef.update({
          'is_ignored': true,
          'updated_at': millis,
        });
        futures.add(sentFuture);

        await Future.wait(futures);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> setIsOnboardingCompleted({
    required String uid,
    required bool isOnboardingCompleted,
  }) {
    return updateUser(
      uid: uid,
      fields: [
        const PulseField(
          key: 'is_onboarding_completed',
          value: true,
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PulseError>> setUserOnlineStatus({
    required String uid,
    required PulseOnlineStatus onlineStatus,
  }) {
    return updateUser(
      uid: uid,
      fields: [
        PulseField(
          key: 'online_status',
          value: ksPulseOnlineStatus[onlineStatus],
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PulseError>> unblockUser({
    required String uid,
    required String friendId,
  }) {
    return runAsyncCall(
      future: () async {
        final blockedUserRef =
            PulseReferenceHelper.blockedUsersCol(uid: uid).doc(friendId);
        final blockedByUserRef =
            PulseReferenceHelper.blockedByUsersCol(uid: friendId).doc(uid);

        await Future.wait([
          blockedUserRef.delete(),
          blockedByUserRef.delete(),
        ]);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> unfollowUser({
    required String uid,
    required String friendId,
  }) {
    return runAsyncCall(
      future: () async {
        final userFollowingRef =
            PulseReferenceHelper.userFollowingsCol(uid: uid).doc(friendId);
        final friendFollowersRef =
            PulseReferenceHelper.userFollowersCol(uid: friendId).doc(uid);

        final futures = <Future>[];

        final userFollowingFuture = userFollowingRef.delete();
        futures.add(userFollowingFuture);

        final friendFollowersFuture = friendFollowersRef.delete();
        futures.add(friendFollowersFuture);

        final userUpdateFuture = updateUser(
          uid: uid,
          fields: [
            const PulseField.negativePartial(
              key: 'following_count',
              value: 1,
            )
          ],
        );
        futures.add(userUpdateFuture);

        final friendUpdateFuture = updateUser(
          uid: friendId,
          fields: [
            const PulseField.negativePartial(
              key: 'followers_count',
              value: 1,
            )
          ],
        );
        futures.add(friendUpdateFuture);

        await Future.wait(futures);
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, PulseError>> updateUser({
    required String uid,
    required List<PulseField> fields,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final userRef = PulseReferenceHelper.userDoc(uid: uid);
        final data = PulseCommonHelper().prepareDataToUpdate(fields: fields);
        if (data.isNotEmpty) {
          await userRef.update({
            ...data,
            'updated_at': millis,
          });
        }
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  Future<dynamic> _addFollowerFollowing({
    required final String uid,
    required final String friendId,
  }) {
    final userFollowersRef =
        PulseReferenceHelper.userFollowersCol(uid: uid).doc(friendId);
    final friendFollowingRef =
        PulseReferenceHelper.userFollowingsCol(uid: friendId).doc(uid);

    final milli = DateTime.now().millisecondsSinceEpoch;

    final futures = <Future>[];

    final userFollower = PulseSubUser(
      uid: friendId,
      createdAt: milli,
    );
    final friendFollower = PulseSubUser(
      uid: uid,
      createdAt: milli,
    );

    final userFollowersFuture = userFollowersRef.set(
      userFollower.toJson(),
    );
    futures.add(userFollowersFuture);

    final friendFollowingFuture = friendFollowingRef.set(
      friendFollower.toJson(),
    );
    futures.add(friendFollowingFuture);

    final userUpdateFuture = updateUser(
      uid: uid,
      fields: [
        const PulseField.positivePartial(
          key: 'followers_count',
          value: 1,
        ),
      ],
    );
    futures.add(userUpdateFuture);

    final friendUpdateFuture = updateUser(
      uid: friendId,
      fields: [
        const PulseField.positivePartial(
          key: 'following_count',
          value: 1,
        ),
      ],
    );
    futures.add(friendUpdateFuture);

    return Future.wait(futures).then((value) {
      log('Success: Adding follower $friendId');
    }).catchError((e) {
      log(e);
      log('Error!!!: Adding follower');
    });
  }

  PulseUser _userFromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PulseUser.fromJson(snap.data() ?? {});
  }

  List<PulseUser> _usersFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PulseUser.fromJson(e.data())).toList();
  }

  List<PulseSubUser> _subUsersFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PulseSubUser.fromJson(e.data())).toList();
  }

  List<PulseFollowRequest> _followRequestsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PulseFollowRequest.fromJson(e.data())).toList();
  }
}
