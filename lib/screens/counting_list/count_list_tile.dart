import 'package:flutter/material.dart';
import 'package:inventory/models/count_item.dart';

class CountListTile extends StatefulWidget {
  const CountListTile(this.countItem, {Key? key}) : super(key: key);

  final CountItem countItem;

  @override
  _CountListTileState createState() => _CountListTileState();
}

class _CountListTileState extends State<CountListTile> {
  late final String id;
  late String name;
  late int value;

  @override
  void initState() {
    super.initState();
    id = widget.countItem.id;
    name = widget.countItem.name;
    value = widget.countItem.value;
  }

  void buttonPressed(int change) {
    setState(() {
      value += change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all()),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Container(
                  width: 30,
                  child: Center(
                    child: Text(
                      '$value',
                      style:
                          TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.red.shade300,
                  onPressed: () {
                    buttonPressed(-1);
                  },
                  child: Text('-'),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    buttonPressed(1);
                  },
                  child: Text('+'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
