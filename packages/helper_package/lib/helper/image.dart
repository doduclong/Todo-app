

import 'dart:convert';

import 'package:flutter/services.dart';

class $MyImageHelper {
  const $MyImageHelper();

  Uint8List? decodeBase64(String? base64String,) {
    if(base64String == null) return null;
    return base64.decode(base64String.replaceAll("\n", ""));
  }

  String? encodeBase64(Uint8List? base64){
    if(base64 == null) return null;
    return base64Encode(base64);
  }

}
