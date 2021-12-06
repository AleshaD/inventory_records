import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/count_bloc/count_bloc.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/screens/counting_list/bottom_controls_btns.dart';
import 'package:inventory/screens/counting_list/count_list_tile.dart';

class CountingListScreen extends StatefulWidget {
  const CountingListScreen({
    Key? key,
    required this.countItems,
  }) : super(key: key);

  final List<CountItem> countItems;

  @override
  State<CountingListScreen> createState() => _CountingListScreenState();
}

class _CountingListScreenState extends State<CountingListScreen>
    with AutomaticKeepAliveClientMixin {
  late List<CountItem> items;

  @override
  void initState() {
    super.initState();
    items = widget.countItems;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    CountBloc _countBloc = BlocProvider.of<CountBloc>(context);
    return BlocListener<CountBloc, CountState>(
      listener: (context, state) {
        if (state is CountItemsFetchedState) {
          setState(() {
            items = state.items;
          });
        }
      },
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 60),
          child: ListView(
            children: [
              for (var i = 0; i < items.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountListTile(items[i], key: ValueKey(items[i].id)),
                )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 60,
            child: BottomControlsBtns(_countBloc),
          ),
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
