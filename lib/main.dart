import 'package:flutter/material.dart';
import 'package:inventory/screens/counting_list/counting_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountingListScreen(),
    );
  }
}
