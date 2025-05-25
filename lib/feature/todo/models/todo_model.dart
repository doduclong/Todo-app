import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/feature/todo/models/repeat_type.dart';

class Todo {
  final int? id;
  Color? color;
  String title;
  String? location;
  String? description;
  DateTime startTime;
  DateTime? endTime;
  bool isCompleted;
  int priority; // 1: thấp, 2: trung bình, 3: cao
  List<String>? tags;
  RepeatType repeatType;
  DateTime? repeatEndDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Todo({
    required this.id,
    this.color,
    this.location,
    required this.startTime,
    this.endTime,
    this.isCompleted = false,
    this.priority = 2, // Mặc định là trung bình
    this.tags,
    required this.title,
    this.description,
    this.repeatType = RepeatType.none,
    this.repeatEndDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

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
