import 'package:flutter/material.dart';
import 'package:todo/feature/todo/models/repeat_type.dart';
import 'package:todo/feature/todo/models/todo_model.dart';
import 'package:todo/feature/todo/utils/todo_utils.dart';

class CreateTodoSheet extends StatefulWidget {
  final void Function(Todo newTodo) onCreate;

  const CreateTodoSheet({super.key, required this.onCreate});

  @override
  State<CreateTodoSheet> createState() => _CreateTodoSheetState();
}

class _CreateTodoSheetState extends State<CreateTodoSheet> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String? description;
  String? location;
  DateTime startTime = DateTime.now();
  DateTime? endTime;
  int priority = 2;
  List<String> tags = [];
  RepeatType repeatType = RepeatType.none;

  final TextEditingController _tagsController = TextEditingController();

  Future<void> _pickDateTime(bool isStart) async {
    final date = await showDatePicker(
      context: context,
      initialDate: isStart ? startTime : endTime ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        isStart ? startTime : endTime ?? DateTime.now(),
      ),
    );

    if (time == null) return;

    final selected = DateTime(date.year, date.month, date.day, time.hour, time.minute);

    setState(() {
      if (isStart) {
        startTime = selected;
      } else {
        endTime = selected;
      }
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final todo = Todo(
      title: title,
      description: description,
      location: location,
      startTime: startTime,
      endTime: endTime,
      priority: priority,
      tags: tags,
      repeatType: repeatType,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    widget.onCreate(todo);
  }

  @override
  void dispose() {
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              controller: scrollController,
              children: [
                const Center(
                  child: Text('Tạo công việc mới',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                  onChanged: (val) => title = val,
                  validator: (val) =>
                  val == null || val.trim().isEmpty ? 'Nhập tiêu đề' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  onChanged: (val) => description = val,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Địa điểm'),
                  onChanged: (val) => location = val,
                ),
                ListTile(
                  title: const Text('Thời gian bắt đầu'),
                  subtitle: Text(startTime.toString()),
                  trailing: const Icon(Icons.access_time),
                  onTap: () => _pickDateTime(true),
                ),
                ListTile(
                  title: const Text('Thời gian kết thúc'),
                  subtitle: Text(endTime?.toString() ?? 'Không có'),
                  trailing: const Icon(Icons.access_time_outlined),
                  onTap: () => _pickDateTime(false),
                ),
                // DropdownButtonFormField<int>(
                //   value: priority,
                //   decoration: const InputDecoration(labelText: 'Ưu tiên'),
                //   items: const [
                //     DropdownMenuItem(value: 1, child: Text('Thấp')),
                //     DropdownMenuItem(value: 2, child: Text('Trung bình')),
                //     DropdownMenuItem(value: 3, child: Text('Cao')),
                //   ],
                //   onChanged: (val) => setState(() {
                //     priority = val ?? 2;
                //   }),
                // ),
                ListTile(
                  title: const Text('Ưu tiên'),
                  subtitle: Text(TodoUtils.getPriorityText(priority)),
                  leading: Icon(
                    Icons.flag,
                    color: {
                      1: Colors.green,
                      2: Colors.orange,
                      3: Colors.red,
                    }[priority],
                  ),
                  trailing: PopupMenuButton<int>(
                    initialValue: priority,
                    onSelected: (val) => setState(() => priority = val),
                    itemBuilder: (context) => [
                      PopupMenuItem(value: 1, child: TodoUtils().buildPriorityItem(1)),
                      PopupMenuItem(value: 2, child: TodoUtils().buildPriorityItem(2)),
                      PopupMenuItem(value: 3, child: TodoUtils().buildPriorityItem(3)),
                    ],
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ),

                DropdownButtonFormField<RepeatType>(
                  value: repeatType,
                  decoration: const InputDecoration(labelText: 'Lặp lại'),
                  items: RepeatType.values
                      .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
                      .toList(),
                  onChanged: (val) => setState(() {
                    repeatType = val ?? RepeatType.none;
                  }),
                ),
                TextFormField(
                  controller: _tagsController,
                  decoration: const InputDecoration(
                      labelText: 'Tags', hintText: 'VD: Gym, Công việc'),
                  onChanged: (val) {
                    tags = val.split(',').map((e) => e.trim()).toList();
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Tạo mới'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
