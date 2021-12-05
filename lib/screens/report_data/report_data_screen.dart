import 'package:flutter/material.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/providers/storage_provider.dart';

class ReportDataScreen extends StatefulWidget {
  final StorageProvider storage;
  const ReportDataScreen(this.storage, {Key? key}) : super(key: key);

  @override
  _ReportDataScreenState createState() => _ReportDataScreenState();
}

class _ReportDataScreenState extends State<ReportDataScreen> {
  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.storage.fetchCountItems(),
      builder: (context, AsyncSnapshot<List<CountItem>> snapshot) {
        if (snapshot.hasData) {
          txtController.value = TextEditingValue(text: getMdTable(snapshot.data!));
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              minLines: 1,
              maxLines: snapshot.data!.length + 4,
              controller: txtController,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  String getMdTable(List<CountItem> items) {
    String table = 'имя | количество';
    table = '$table\n:--- | ---:';
    int total = 0;
    for (var item in items) {
      total += item.value;
      table = '$table\n${item.name} | ${item.value}';
    }
      table = '$table\nвсего | $total';
    return table;
  }
}
