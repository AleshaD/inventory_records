import 'package:flutter/material.dart';
import 'package:inventory/mocks.dart';
import 'package:inventory/screens/counting_list/count_list_tile.dart';

class CountingListScreen extends StatelessWidget {
  const CountingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список для подсчёта'),
      ),
      body: ListView(
        children: List.generate(
          countItemsMock.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CountListTile(countItemsMock[index]),
          ),
        ),
      ),
    );
  }
}
