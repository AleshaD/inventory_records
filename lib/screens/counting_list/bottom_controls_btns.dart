import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/count_bloc/count_bloc.dart';
import 'package:inventory/models/count_item.dart';

class BottomControlsBtns extends StatefulWidget {
  final CountBloc countBloc;
  const BottomControlsBtns(this.countBloc);

  @override
  _BottomControlsBtnsState createState() => _BottomControlsBtnsState();
}

class _BottomControlsBtnsState extends State<BottomControlsBtns> {
  final TextEditingController searchTxtController = TextEditingController();
  bool buttonsOrTxtField = true;

  @override
  void initState() {
    super.initState();
    searchTxtController.value = TextEditingValue.empty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonsOrTxtField
              ? Row(
                  children: [
                    MaterialButton(
                      height: 45,
                      color: Colors.red,
                      onPressed: () {
                        widget.countBloc.add(CountBlocFetchItems());
                      },
                      child: Text(
                        'sort',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    MaterialButton(
                      height: 45,
                      minWidth: 160,
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          CountItem item = CountItem(
                              id: DateTime.now().millisecondsSinceEpoch, name: 'name', value: 0);
                          widget.countBloc.add(CountAddItemEvent(item));
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: searchTxtController,
                      onChanged: (value) =>
                          BlocProvider.of<CountBloc>(context).add(CountFetchedBySort(value)),
                    ),
                  ),
                ),
          SizedBox(
            width: 16,
          ),
          MaterialButton(
            height: 45,
            color: Colors.amber,
            onPressed: () {
              setState(() {
                buttonsOrTxtField = !buttonsOrTxtField;
              });
            },
            child: Text(
              buttonsOrTxtField ? 'to search' : 'to add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
