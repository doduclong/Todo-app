

import 'package:flutter/foundation.dart';

void myPrint(Object? object, {String? tag}) {
  if (kDebugMode) {
    print(tag == null ? object : "$tag: $object");
  }
}

void myDebugPrint(Object? object, {String? tag}) {
    debugPrint(tag == null ? object.toString() : "$tag: $object");
}
