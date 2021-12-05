import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/count_bloc/count_bloc.dart';
import 'package:inventory/mocks.dart';
import 'package:inventory/models/count_item.dart';
import 'package:inventory/providers/storage_provider.dart';
import 'package:inventory/screens/counting_list/counting_list_screen.dart';
import 'package:inventory/screens/report_data/report_data_screen.dart';

class HomeScreen extends StatelessWidget {
  final storage = StorageProvider();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Inventory Records'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: TabBar(tabs: [
                Tab(
                  child: Icon(
                    Icons.list_alt_outlined,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.data_saver_on,
                  ),
                )
              ]),
            ),
          ),
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CountBloc>(context).add(DeleteAllItemsEvent());
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.red,
                        child: Icon(Icons.delete_forever),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        List<CountItem> mockWithCorrectId = [];

                        for (var i = 0; i < countItemsMock.length; i++) {
                          mockWithCorrectId.add(
                            CountItem(
                                id: countItemsMock[i].id + i + 2,
                                name: countItemsMock[i].name,
                                value: countItemsMock[i].value),
                          );
                        }
                        for (var mock in mockWithCorrectId) {
                          BlocProvider.of<CountBloc>(context).add(CountAddItemEvent(mock));
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.blue,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CountingListScreen(
                countItems: [],
              ),
              ReportDataScreen(),
            ],
          )),
    );
  }
}
