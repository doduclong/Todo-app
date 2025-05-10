import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/feature/todo/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DBProvider database;

  TodoBloc(this.database) : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await database.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Không thể tải danh sách Todo: $e'));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      await database.insertTodo(event.todo);
      final todos = await database.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Không thể thêm Todo: $e'));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      await database.updateTodo(event.todo);
      final todos = await database.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Không thể cập nhật Todo: $e'));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await database.deleteTodo(event.id);
      final todos = await database.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Không thể xóa Todo: $e'));
    }
  }
}