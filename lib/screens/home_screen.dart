import 'package:flutter/material.dart';
import 'package:inventory/mocks.dart';
import 'package:inventory/screens/counting_list/counting_list_screen.dart';
import 'package:inventory/screens/report_data/report_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        body: TabBarView(
          children: [
            CountingListScreen(countItems: countItemsMock),
            ReportDataScreen(),
          ],
        ),
      ),
    );
  }
}
