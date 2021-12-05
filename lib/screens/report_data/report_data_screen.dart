import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/count_bloc/count_bloc.dart';
import 'package:inventory/models/count_item.dart';

class ReportDataScreen extends StatefulWidget {
  const ReportDataScreen({Key? key}) : super(key: key);

  @override
  _ReportDataScreenState createState() => _ReportDataScreenState();
}

class _ReportDataScreenState extends State<ReportDataScreen> {
  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CountBloc, CountState>(
          builder: (context, state) {
            if (state is CountItemsFetchedState) {
              txtController.value = TextEditingValue(text: getMdTable(state.items));
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: state.items.length + 4,
                    controller: txtController,
                  ),
                ),
              );
            }
            return Expanded(
              child: Center(
                child: Text('click update'),
              ),
            );
          },
        ),
        MaterialButton(
          onPressed: () => BlocProvider.of<CountBloc>(context).add(
            CountBlocFetchItems(),
          ),
          child: Container(
            height: 40,
            width: 160,
            color: Colors.blue,
            child: Icon(Icons.refresh, color: Colors.white,),
          ),
        )
      ],
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
