import 'package:bhavishya_puran_departure/Model/data_model.dart';
import 'package:flutter/material.dart';

class detali_page extends StatefulWidget {
  const detali_page({super.key});

  @override
  State<detali_page> createState() => _detali_pageState();
}

class _detali_pageState extends State<detali_page> {
  @override
  Widget build(BuildContext context) {
    List data =
    ModalRoute.of(context)!.settings.arguments as List<Geeta>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page "),
      ),
      body: Center (
        child: Text (data[0].no),
      ),
    );
  }
}