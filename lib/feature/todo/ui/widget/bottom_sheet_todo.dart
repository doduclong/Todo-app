import 'package:flutter/material.dart';
import 'package:todo/core/language/l10n/l10n.dart';
import 'package:todo/feature/todo/models/todo_model.dart';
import 'package:todo/feature/todo/utils/todo_utils.dart';

class BottomSheetTodo extends StatelessWidget {
   const BottomSheetTodo({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (todo.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(todo.description!),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Thời gian: ${_formatTime(todo.startTime)}'
                  '${todo.endTime != null ? ' - ${_formatTime(todo.endTime!)}' : ''}',
            ),
          ),
          if (todo.location != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Địa điểm: ${todo.location}'),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text('Mức ưu tiên: ${TodoUtils.getPriorityText(todo.priority)}'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text('Lặp lại: ${todo.repeatType.name}'),
          ),
          if (todo.tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Wrap(
                spacing: 6,
                children: todo.tags
                    .map((tag) => Chip(
                  label: Text(tag),
                  backgroundColor: Colors.blue.shade100,
                ))
                    .toList(),
              ),
            ),
        ],
      ),
    );

    //   Container(
    //   padding: EdgeInsets.all(8),
    //   width: double.infinity,
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           IconButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //               icon: const Icon(
    //                 Icons.check,
    //                 color: Colors.green,
    //               )),
    //           IconButton(
    //               onPressed: () {},
    //               icon: const Icon(
    //                 Icons.delete_outline_outlined,
    //                 color: Colors.red,
    //               )),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

   String _formatTime(DateTime dt) {
     return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
   }
}
