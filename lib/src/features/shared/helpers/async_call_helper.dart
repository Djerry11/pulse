import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pulse/src/features/shared/helpers/reference_helper.dart';
import 'package:pulse/src/features/shared/models/error_model.dart';

/// Used to abstract the error handling when making API requests.
/// For a function [future], executes the [onError]
/// and catches the error. Also logs the error.
///
/// This function is based on the premise that exceptions should not
/// propagate further unhandled from the repository layer.
Future<T> runAsyncCall<T>({
  required Future<T> Function() future,
  required T Function(PulseError) onError,
  final bool withLog = true,
}) async {
  try {
    final response = await future();
    if (withLog) {
      log(
        'Success: $future executed successfully',
        name: '$future',
      );
    }
    return response;
  } catch (e, stk) {
    if (withLog) {
      log(
        'Error!!!: $future executed with an error',
        name: '$future',
        error: e,
        stackTrace: stk,
      );
    }

    var pulseError = PulseError(
      message: '$future: An error occurred',
      detailedMessage: e.toString(),
    );

    if (e is FirebaseException) {
      pulseError = PulseError(
        message: e.message.toString(),
        detailedMessage: e.toString(),
        code: e.code,
      );
    } else if (e is FirebaseAuthException) {
      pulseError = PulseError(
        message: e.message.toString(),
        detailedMessage: e.toString(),
        code: e.code,
      );
    } else if (e is Exception) {
      pulseError = PulseError(
        message: e.toString(),
      );
    } else if (e is Error) {
      if (e is ArgumentError) {
        pulseError = PulseError(
          message: e.message,
        );
      } else if (e is AssertionError) {
        pulseError = PulseError(
          message: e.message.toString(),
        );
      } else {
        pulseError = PulseError(
          message: e.toString(),
        );
      }
    } else if (e is PulseError) {
      pulseError = e;
    }

    return onError(pulseError);
  }
}

/// Executes the given [TransactionHandler] and then attempts to commit the
/// changes applied within an atomic transaction.
///
/// In the [TransactionHandler], a set of reads and writes can be performed
/// atomically using the [Transaction] object passed to the [TransactionHandler].
/// After the [TransactionHandler] is run, [FirebaseFirestore] will attempt to apply the
/// changes to the server. If any of the data read has been modified outside
/// of this [Transaction] since being read, then the transaction will be
/// retried by executing the provided [TransactionHandler] again. If the transaction still
/// fails after 5 retries, then the transaction will fail.s
///
/// The [TransactionHandler] may be executed multiple times, it should be able
/// to handle multiple executions.
///
/// Data accessed with the transaction will not reflect local changes that
/// have not been committed. For this reason, it is required that all
/// reads are performed before any writes. Transactions must be performed
/// while online. Otherwise, reads will fail, and the final commit will fail.
///
/// By default transactions are limited to 30 seconds of execution time. This
/// timeout can be adjusted by setting the timeout parameter.
///
/// By default transactions will retry 5 times. You can change the number of attemps
/// with [maxAttempts]. Attempts should be at least 1.
Future<T> runTransaction<T>({
  required Future<T> Function(Transaction) onTransaction,
  required T Function(PulseError) onError,
  final bool withLog = true,
  final Duration timeout = const Duration(seconds: 30),
  final int maxAttempts = 5,
}) async {
  return runAsyncCall(
    future: () async {
      return PulseReferenceHelper.ref.runTransaction<T>(
        (transaction) => onTransaction(transaction),
        timeout: timeout,
        maxAttempts: maxAttempts,
      );
    },
    onError: onError,
    withLog: withLog,
  );
}
