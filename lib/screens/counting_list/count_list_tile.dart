import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/count_bloc/count_bloc.dart';
import 'package:inventory/models/count_item.dart';

class CountListTile extends StatefulWidget {
  const CountListTile(this.countItem,{Key? key}) : super(key: key);

  final CountItem countItem;

  @override
  _CountListTileState createState() => _CountListTileState();
}

class _CountListTileState extends State<CountListTile> with AutomaticKeepAliveClientMixin {
  late final int id;
  late String name;
  final TextEditingController nameTxtController = TextEditingController();
  final txtFieldDecoration = new InputDecoration(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
  );

  final TextEditingController valueTxtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    id = widget.countItem.id;
    nameTxtController.value = TextEditingValue(text: widget.countItem.name);
    valueTxtController.value = TextEditingValue(text: widget.countItem.value.toString());
  }

  void buttonPressed(int change, CountBloc countBloc) {
    setState(() {
      int value = int.parse(valueTxtController.text);
      value += change;
      valueTxtController.value = TextEditingValue(text: value.toString());
      countBloc.add(CountEditItemEvent(countItem));
    });
  }

  CountItem get countItem => CountItem(
        id: id,
        name: nameTxtController.text,
        value: int.parse(valueTxtController.text),
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    CountBloc _countBloc = BlocProvider.of<CountBloc>(context);
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
                child: TextField(
                  controller: nameTxtController,
                  decoration: txtFieldDecoration,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: valueTxtController,
                  textAlign: TextAlign.center,
                  decoration: txtFieldDecoration,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
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
                    buttonPressed(-1, _countBloc);
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
                    buttonPressed(1, _countBloc);
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

  @override
  bool get wantKeepAlive => true;
}
