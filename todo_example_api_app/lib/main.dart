import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_example_api_app/providers/todo_provider.dart';
import 'package:todo_example_api_app/views/add_note.dart';
import 'package:todo_example_api_app/views/my_home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
      path: "/",
      name: "home",
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: "/addNote",
      name: "addNote",
      builder: (context, state) => AddNote(),
    ),
  ]);
}
