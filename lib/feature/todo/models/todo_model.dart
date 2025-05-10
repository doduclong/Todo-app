import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/feature/todo/models/repeat_type.dart';

class Todo {
  final int? id;
  final Color color;
  final String title;
  final String location;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> tags;
  final RepeatType repeatType;
  final DateTime? repeatEndDate;

  Todo(
      {required this.color,
      required this.location,
      required this.startTime,
      required this.endTime,
      required this.tags,
      required this.title,
      required this.description,
      this.repeatType = RepeatType.none,
      this.repeatEndDate,
      this.id});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        color: Color(json['color']),
        location: json['location'],
        startTime: DateTime.fromMillisecondsSinceEpoch(json['start_time']),
        endTime: DateTime.fromMillisecondsSinceEpoch(json['end_time']),
        tags: List<String>.from(jsonDecode(json['tags']) ?? []),
        repeatType: RepeatType.values.firstWhere(
          (e) => e.name == json['repeat_type'],
          orElse: () => RepeatType.none, // fallback nếu không khớp
        ),
        repeatEndDate: json['repeat_end_date'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['repeat_end_date'])
            : null,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'start_time': startTime.millisecondsSinceEpoch,
      'end_time': endTime.millisecondsSinceEpoch,
      'color': color.value, // Store color as integer
      'tags': jsonEncode(tags), // Store tags as JSON string
      'repeat_type': repeatType.name,
      'repeat_end_date': repeatEndDate?.millisecondsSinceEpoch,
    };
  }
}
