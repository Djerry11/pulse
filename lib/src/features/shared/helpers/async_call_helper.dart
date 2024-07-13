import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pulse/src/features/shared/helpers/reference_helper.dart';
import 'package:pulse/src/features/shared/models/error_model.dart';

/// Executes a given async function [future] and handles errors by executing [onError].
/// This function is used to abstract the error handling when making API requests.
/// If [withLog] is true, it logs the success or error.
/// Exceptions are caught and wrapped into a [PulseError] object.
/// This ensures exceptions do not propagate further from the repository layer.
Future<T> runAsyncCall<T>({
  required Future<T> Function() future, // The async function to be executed
  required T Function(PulseError) onError, // Function to handle errors
  final bool withLog = true, // Whether to log the operation
  final int retryCount = 3, // Number of retries for the async call
  final Duration timeout =
      const Duration(seconds: 30), // Timeout for the async call
}) async {
  int attempts = 0;

  while (attempts < retryCount) {
    try {
      final response =
          await future().timeout(timeout); // Execute the future with timeout
      if (withLog) {
        log(
          'Success: ${future.toString()} executed successfully',
          name: 'runAsyncCall',
        );
      }
      return response; // Return the successful response
    } catch (e, stk) {
      attempts++;

      if (attempts >= retryCount) {
        if (withLog) {
          log(
            'Error!!!: ${future.toString()} executed with an error',
            name: 'runAsyncCall',
            error: e,
            stackTrace: stk,
          );
        }

        // Create a PulseError based on the exception type
        var pulseError = PulseError(
          message: '${future.toString()}: An error occurred',
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
        } else if (e is TimeoutException) {
          pulseError = PulseError(
            message: 'Timeout: The operation took longer than expected',
            detailedMessage: e.toString(),
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

        return onError(
            pulseError); // Handle the error using the provided function
      }
    }
  }

  throw Exception(
      'Unexpected error: reached the end of runAsyncCall without returning.');
}

//-------------------------------------------------------------------
/// Executes a Firestore transaction and handles errors.
/// A [TransactionHandler] function [onTransaction] is executed within an atomic transaction.
/// If the transaction fails, it retries up to [maxAttempts] times.
/// Errors are handled using [onError] function and logged if [withLog] is true.
/// The transaction timeout can be adjusted using [timeout].
/// [PulseReferenceHelper.firestoreRef] is used to access Firestore instance.
Future<T> runTransaction<T>({
  required Future<T> Function(Transaction)
      onTransaction, // Function to execute the transaction
  required T Function(PulseError) onError, // Function to handle errors
  final bool withLog = true, // Whether to log the operation
  final Duration timeout =
      const Duration(seconds: 30), // Timeout for the transaction
  final int maxAttempts = 5, // Maximum number of retry attempts
  final int retryCount = 3, // Number of retries for the async call
}) async {
  return runAsyncCall(
    future: () async {
      return PulseReferenceHelper.firestoreRef.runTransaction<T>(
        (transaction) => onTransaction(transaction),
        timeout: timeout,
        maxAttempts: maxAttempts,
      );
    },
    onError: onError,
    withLog: withLog,
    retryCount: retryCount,
    timeout: timeout,
  );
}
