import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/core/language/l10n/l10n.dart';
import 'package:todo/feature/todo/bloc/todo_bloc.dart';
import 'package:todo/feature/todo/models/repeat_type.dart';
import 'package:todo/feature/todo/models/todo_model.dart';
import 'package:todo/feature/todo/ui/widget/todo_widget.dart';
import 'package:todo/routes/route.dart';
import 'package:todo/routes/routes_name.dart';
import 'widget/percentage_circle.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(l10n.home),
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.setting);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/img.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient:  LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Colors.blue.withOpacity(0.3), Colors.blue.withOpacity(0.7)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    children: [
                      PercentageCircle(
                        percentage: 0.5,
                        size: 120,
                        backgroundColor: Colors.grey.shade300,
                        progressColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  final todo = Todo(
                    title: "Lau nha",
                    description: "Nha",
                    location: "Ha Noi",
                    startTime: DateTime.now(),
                    endTime: DateTime.now(),
                    color: Colors.blue.withOpacity(0.3),
                    tags: ["Gym", "Work"],
                    repeatType: RepeatType.none,
                    repeatEndDate: null
                  );
                  context.read<TodoBloc>().add(AddTodo(todo));
                  //Navigator.pop(context);
                },
                child: const Text('Thêm'),
              ),

              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TodoLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          final todo = state.todos[index];
                          return Dismissible(
                            key: Key(todo.id.toString()),
                            onDismissed: (direction) {
                              context.read<TodoBloc>().add(DeleteTodo(todo.id!));
                            },
                            background: Container(color: Colors.red),
                            child: TodoWidget(todo: todo),
                          );
                        },
                      );
                    } else if (state is TodoError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text('Bắt đầu nào!'));
                  },
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: 5,
              //     itemBuilder: (_, index) {
              //       return TodoWidget(
              //           color: Colors.blue.withOpacity(0.4),
              //           title: "Gym",
              //           location: "Blue Gym",
              //           description: "",
              //           startTime: "2:00 PM",
              //           endTime: "3:30 PM",
              //           tags: [
              //             "Gym",
              //             "Work",
              //             "Home",
              //           ]
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}
