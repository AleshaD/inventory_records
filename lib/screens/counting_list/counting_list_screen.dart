import 'package:flutter/material.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/providers/storage_provider.dart';
import 'package:inventory/screens/counting_list/count_list_tile.dart';

class CountingListScreen extends StatefulWidget {
  final StorageProvider storage;
  const CountingListScreen({Key? key, required this.countItems, required this.storage})
      : super(key: key);

  final List<CountItem> countItems;

  @override
  State<CountingListScreen> createState() => _CountingListScreenState();
}

class _CountingListScreenState extends State<CountingListScreen> with AutomaticKeepAliveClientMixin {
  late List<CountItem> items;

  @override
  void initState() {
    super.initState();
    items = widget.countItems;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: [
      Container(
        padding: EdgeInsets.only(bottom: 50),
        child: ListView(
          children: [
            for (var i = 0; i < items.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CountListTile(items[i], widget.storage),
              )
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                height: 45,
                color: Colors.red,
                onPressed: () {
                  for (var item in items) {
                    widget.storage.deleteCountItem(item.id);
                  }
                  setState(() {
                    items = [];
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: MaterialButton(
                  height: 45,
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      CountItem item = CountItem(id: DateTime.now().millisecond, name: 'name', value: 0);
                      items.add(item);
                      widget.storage.insertCountItem(item);
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
