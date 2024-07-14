import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pulse/src/constants/firestore_constants.dart';

typedef ColRef = CollectionReference<Map<String, dynamic>>;
typedef DocRef = DocumentReference<Map<String, dynamic>>;

class PulseReferenceHelper {
  //------------------- ONE TIME INITIALIZATION AND SHARING FIRESTORE REFERENCE -------------------//
  static final _ref = FirebaseFirestore.instance;
  static FirebaseFirestore get firestoreRef => _ref;

  String get uniqueId => _ref.collection('random').doc().id;

  static String mainCollectionPrefix = '';
  static String mainCollectionSuffix = '';

  //------------------- MAIN COLLECTIONS -------------------//
  static ColRef get usersCol => _ref
      .collection('$mainCollectionPrefix$usersColName$mainCollectionSuffix');
  static ColRef get feedsCol => _ref
      .collection('$mainCollectionPrefix$feedsColName$mainCollectionSuffix');
  static ColRef get chatsCol => _ref
      .collection('$mainCollectionPrefix$chatsColName$mainCollectionSuffix');
  static ColRef get momentsCol => _ref
      .collection('$mainCollectionPrefix$momentsColName$mainCollectionSuffix');
  static ColRef get hashtagsCol => _ref
      .collection('$mainCollectionPrefix$hashtagsColName$mainCollectionSuffix');
  static ColRef get reportsCol => _ref
      .collection('$mainCollectionPrefix$reportsColName$mainCollectionSuffix');
  //

  //-------------------MAIN DOCUMENT REFERENCES -------------------//
  static DocRef userDoc({required final String? uid}) => usersCol.doc(uid);
  static DocRef feedDoc({required final String? feedId}) =>
      feedsCol.doc(feedId);
  static DocRef chatDoc({required final String? chatId}) =>
      chatsCol.doc(chatId);
  static DocRef momentDoc({required final String? momentId}) =>
      momentsCol.doc(momentId);
  static DocRef hashtagDoc({required final String? hashtag}) =>
      hashtagsCol.doc(hashtag);
  static DocRef reportDoc({required final String? reportId}) =>
      reportsCol.doc(reportId);
  //

  //-------------------SUB USERS COLLECTIONS -------------------//
  static ColRef receivedFollowRequestsCol({required final String uid}) =>
      usersCol.doc(uid).collection(receivedFollowRequestsColName);

  static ColRef sentFollowRequestsCol({required final String uid}) =>
      usersCol.doc(uid).collection(sentFollowRequestsColName);

  static ColRef userFollowersCol({required final String uid}) =>
      usersCol.doc(uid).collection(userFollowersColName);

  static ColRef userFollowingsCol({required final String uid}) =>
      usersCol.doc(uid).collection(userFollowingsColName);

  static ColRef notificationsCol({required final String uid}) =>
      usersCol.doc(uid).collection(notificationsColName);

  static ColRef myFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(myFeedsColName);

  static ColRef hiddenFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(hiddenFeedsColName);

  static ColRef reactedFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(reactedFeedsColName);

  static ColRef commentedFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(commentedFeedsColName);

  static ColRef repliedFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(repliedFeedsColName);

  static ColRef savedFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(savedFeedsColName);

  static ColRef viewedFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(viewedFeedsColName);

  static ColRef followedFeedsCol({required final String uid}) =>
      usersCol.doc(uid).collection(followedFeedsColName);

  static ColRef blockedUsersCol({required final String uid}) =>
      usersCol.doc(uid).collection(blockedUsersColName);

  static ColRef blockedByUsersCol({required final String uid}) =>
      usersCol.doc(uid).collection(blockedByUsersColName);

  static ColRef devicesCol({required final String uid}) =>
      usersCol.doc(uid).collection(devicesColName);
  //

  //------------------- FEEDS SUB COLLECTIONS -------------------//
  static ColRef reactionsCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(reactionsColName);

  static ColRef commentsCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(commentsColName);

  static ColRef pollOptionChoosersCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(pollOptionChoosersColName);

  static ColRef feedReactorsCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(feedReactorsColName);

  static ColRef feedCommentersCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(feedCommentersColName);

  static ColRef feedRepliersCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(feedRepliersColName);

  static ColRef feedSaversCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(feedSaversColName);

  static ColRef feedViewersCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(feedViewersColName);

  static ColRef feedFollowersCol({required final String feedId}) =>
      feedsCol.doc(feedId).collection(feedFollowersColName);
  //

  //------------------- MOMENTS SUB COLLECTIONS -------------------//
  static ColRef momentViewersCol({required final String momentId}) =>
      momentsCol.doc(momentId).collection(momentViewersColName);
  //

  //------------------- CHATS SUB COLLECTIONS -------------------//
  static ColRef messagesCol({required final String chatId}) =>
      chatsCol.doc(chatId).collection(messagesColName);

  static ColRef chatMediasLinksFilesCol({required final String chatId}) =>
      chatsCol.doc(chatId).collection(mediasLinksFilesColName);
  //

  //------------------- HASHTAGS SUB COLLECTIONS -------------------//
  static ColRef hashtagFeedsCol({required final String hashtag}) =>
      hashtagsCol.doc(hashtag).collection(feedsColName);
  //
}
