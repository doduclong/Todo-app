import 'package:flutter/material.dart';
import 'package:todo/core/convert/datetime_convert.dart';
import 'package:todo/feature/todo/models/todo_model.dart';
import 'package:todo/feature/todo/ui/widget/bottom_sheet_todo.dart';
import 'package:todo/feature/todo/ui/widget/tag_widget.dart';
import 'package:ui_core/src.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MySubWidgets.bottomSheet
            .showMyBottomSheet(context: context, child: BottomSheetTodo(todo: todo,));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: todo.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    todo.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${DatetimeConvert.datetimeToString(todo.startTime)} - ${DatetimeConvert.datetimeToString(todo.endTime)}',
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[700],
                ),
                Text(
                  todo.location ?? "",
                ),
              ],
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              children: todo.tags.map((tag) => TagWidget(tag: tag)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
