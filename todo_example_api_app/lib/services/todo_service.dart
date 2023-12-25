import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_example_api_app/models/todo_model.dart';

class TodoService {
  final String serverUrl = "https://calm-plum-jaguar-tutu.cyclic.app/todos";
  final _dio = Dio();

  Future<List<Todo>> getTodosList() async {
    try {
      final responseValue = await _dio.get(serverUrl);
      if (responseValue.statusCode == 200) {
        final TodoModel todoModel = TodoModel.fromJson(responseValue.data);

        //list.map((e) => Todo.fromJson(list));
      }
      return [];
    } catch (e) {
      throw "Error!!";
    }
  }
}
