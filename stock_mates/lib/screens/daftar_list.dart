import 'package:flutter/material.dart';
import 'package:stock_mates/models/stockmates_model.dart';
import 'package:stock_mates/widgets/left_drawer.dart';

List dataStockMates = <Stock>[];

class DataStockPage extends StatefulWidget {
  const DataStockPage({super.key});

  @override
  State<DataStockPage> createState() => _DataStockPageState();
}

class _DataStockPageState extends State<DataStockPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Center(
          child: Text(
            "Lihat Stock",
          )
        ),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[for (Stock i in dataStockMates) i.show()],
        )
      ),
    );
  }
}