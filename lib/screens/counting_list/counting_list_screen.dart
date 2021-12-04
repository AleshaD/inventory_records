import 'package:flutter/material.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/screens/counting_list/count_list_tile.dart';

class CountingListScreen extends StatefulWidget {
  const CountingListScreen({Key? key, required this.countItems}) : super(key: key);

  final List<CountItem> countItems;

  @override
  State<CountingListScreen> createState() => _CountingListScreenState();
}

class _CountingListScreenState extends State<CountingListScreen> {
  late List<CountItem> items;

  @override
  void initState() {
    super.initState();
    items = widget.countItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список для подсчёта'),
      ),
      body: ListView(
        children: List.generate(
          items.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CountListTile(items[index]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add(CountItem(id: '6', name: 'name', value: 10));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
