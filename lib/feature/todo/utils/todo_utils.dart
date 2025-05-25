import 'package:flutter/material.dart';

class TodoUtils {
  static String getPriorityText(int priority) {
    switch (priority) {
      case 1:
        return 'Thấp';
      case 2:
        return 'Trung bình';
      case 3:
        return 'Cao';
      default:
        return 'Không rõ';
    }
  }

  Widget buildPriorityItem(int p) {
    return Row(
      children: [
        Icon(
          Icons.flag,
          color: {
            1: Colors.green,
            2: Colors.orange,
            3: Colors.red,
          }[p],
        ),
        const SizedBox(width: 8),
        Text(getPriorityText(p)),
      ],
    );
  }
}
