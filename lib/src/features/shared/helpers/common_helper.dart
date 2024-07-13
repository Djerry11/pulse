import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pulse/src/extensions/string_extensions.dart';
import 'package:pulse/src/features/shared/models/field_model.dart';

class PulseCommonHelper {
  void printListening({required final String text}) {
    log('Started getting $text');
  }

  Map<String, dynamic> prepareDataToUpdate({
    required final List<PulseField> fields,
  }) {
    final data = <String, dynamic>{};

    for (final field in fields) {
      final key = field.useKeyAsItIs ? field.key : field.key.toJsonKey;

      switch (field.type) {
        case PulseFieldType.delete:
          data[key] = FieldValue.delete();
          break;
        case PulseFieldType.positivePartial:
          if (field.value is num) {
            data[key] = FieldValue.increment(field.value);
          } else if (field.value is List) {
            data[key] = FieldValue.arrayUnion(field.value);
          } else {
            throw Exception(
              "value must be either a [num] type or a [List] type",
            );
          }
          break;
        case PulseFieldType.negativePartial:
          if (field.value is num) {
            data[key] = FieldValue.increment(-field.value);
          } else if (field.value is List) {
            data[key] = FieldValue.arrayRemove(field.value);
          } else {
            throw Exception(
              "value must be either a [num] type or a [List] type",
            );
          }
          break;
        default:
          data[key] = field.value;
      }
    }

    return data;
  }

  List<String> getHashtagsFromText({
    required final String text,
  }) {
    final result = <String>[];

    var thisText = text;

    while (thisText.contains('#')) {
      final hashIndex = thisText.indexOf('#');

      if (hashIndex != -1) {
        final newText = thisText.substring(hashIndex, thisText.length);

        final splittedText = newText.split(' ');
        if (splittedText.isNotEmpty) {
          final hashTagText = splittedText.first;

          result.add(hashTagText);
          thisText = thisText.replaceAll(hashTagText, '');
        }
      }
    }

    return result;
  }

  List<String> getSearchKeys({
    required final String text,
  }) {
    final searchKeys = <String>[];

    var text0 = text.length > 300 ? text.substring(0, 300) : text;
    final texts = text0.split(' ');

    // split letters of text
    for (int i = 0; i < text0.length; i++) {
      final letter = text0.substring(0, i + 1);
      if (!searchKeys.contains(letter.toUpperCase())) {
        searchKeys.add(letter.toUpperCase());
      }
    }
    //

    // split letters of texts
    for (int i = 0; i < texts.length; i++) {
      for (int j = 0; j < texts[i].length; j++) {
        final letter = texts[i].substring(0, j + 1);
        if (!searchKeys.contains(letter.toUpperCase())) {
          searchKeys.add(letter.toUpperCase());
        }
      }
    }
    //

    return searchKeys
        .where((element) =>
            element.trim() != '' &&
            element.trim() != ',' &&
            element.trim() != '.')
        .toList();
  }

  List<String> getUrlsFromText({
    required final String text,
  }) {
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(text);

    final urls = <String>[];
    for (var match in matches) {
      final url = text.substring(match.start, match.end);
      urls.add(url);
    }

    return urls;
  }
}
