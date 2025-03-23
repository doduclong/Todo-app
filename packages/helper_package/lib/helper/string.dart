

import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class $MyStringHelper {
   $MyStringHelper();

  bool isVietnamese({
    required String text,
    bool hasNumber = false,
    bool hasSpace = true,
  }) {
    final vietnameseRegex = <RegExp>[
      RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
      RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
      RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
      RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
      RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
      RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
      RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
      RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
      RegExp(r'ì|í|ị|ỉ|ĩ'),
      RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
      RegExp(r'đ'),
      RegExp(r'Đ'),
      RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
      RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ'),
      if (hasSpace) RegExp(r'[a-zA-Z ]') else RegExp(r'[a-zA-Z]'),
      if(hasNumber) RegExp(r'[0-9]')
    ];

    for (final element in vietnameseRegex) { text = text.replaceAll(element, "");}

    return text.isEmpty;
  }

  List<TextInputFormatter> inputFormattersDMY = [
    MaskTextInputFormatter(mask: "Dd/Mm/Yyyy",
      filter: {
        "D": RegExp(r'[0-3]'),
        "d": RegExp(r'[0-9]'),
        "M": RegExp(r'[0-1]'),
        "m": RegExp(r'[0-9]'),
        "Y": RegExp(r'[1-3]'),
        "y": RegExp(r'[0-9]'),
      },
    ),
  ];

   List<TextInputFormatter> inputFormattersDMYEasy = [
     MaskTextInputFormatter(mask: "##/##/####",
       filter: {
         "#": RegExp(r'[0-9]'),
       },
     ),
   ];

   List<TextInputFormatter> inputFormattersMax1000Characters = [
     LengthLimitingTextInputFormatter(1000),
   ];

   String limitString(String? text, {int limitLength = 1000}){
     if(text == null) return "";
     return text.length > limitLength ? "${text.substring(0, limitLength)}..." : text;
   }

   Future<void> copy(String? text) async {
     if(text == null) return;
     await Clipboard.setData(ClipboardData(text: text));
   }

}
