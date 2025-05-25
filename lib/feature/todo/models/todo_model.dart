import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/feature/todo/models/repeat_type.dart';

class Todo {
  int? id;
  Color? color;
  String title;
  String? location;
  String? description;
  DateTime startTime;
  DateTime? endTime;
  bool isCompleted;
  int priority; // 1: thấp, 2: trung bình, 3: cao
  List<String> tags;
  RepeatType repeatType;
  DateTime? repeatEndDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Todo({
    this.id,
    required this.startTime,
    required this.title,
    this.color,
    this.location,
    this.endTime,
    this.isCompleted = false,
    this.priority = 2, // Mặc định là trung bình
    List<String>? tags,
    this.description,
    this.repeatType = RepeatType.none,
    this.repeatEndDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : tags = tags ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        color: Color(json['color']),
        isCompleted: json['is_completed'] == '1', // Convert int to bool
        priority: json['priority'] ?? 2, // Mặc định là trung bình
        location: json['location'],
        startTime: DateTime.fromMillisecondsSinceEpoch(json['start_time']),
        endTime: DateTime.fromMillisecondsSinceEpoch(json['end_time']),
        createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updated_at']),
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
      'is_completed': isCompleted ? '1' : '0', // Convert bool to int
      'priority': priority,
      'start_time': startTime.millisecondsSinceEpoch,
      'end_time': endTime?.millisecondsSinceEpoch,
      'color': color?.value, // Store color as integer
      'tags': jsonEncode(tags), // Store tags as JSON string
      'repeat_type': repeatType.name,
      'repeat_end_date': repeatEndDate?.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
    };
  }
}
