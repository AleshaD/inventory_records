import 'package:flutter/material.dart';
import 'package:inventory/providers/storage_provider.dart';

class ReportDataScreen extends StatefulWidget {
  final StorageProvider storage;
  const ReportDataScreen(this.storage, { Key? key }) : super(key: key);

  @override
  _ReportDataScreenState createState() => _ReportDataScreenState();
}

class _ReportDataScreenState extends State<ReportDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Report'),
    );
  }
}
