import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sa7ti/radial.dart';
import 'Kconstants.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Donut Chart',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<LinearSales, int>> seriesList = [
      charts.Series<LinearSales, int>(
        id: 'Sales',

        colorFn: (LinearSales sales, _) => sales.color,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: [
           LinearSales(0, 100, charts.MaterialPalette.red.shadeDefault),
         LinearSales(1, 75,charts.MaterialPalette.green.shadeDefault),
          LinearSales(2, 25,charts.MaterialPalette.deepOrange.shadeDefault),

        ],
      ),
    ];

    charts.PieChart chart = charts.PieChart<int>(seriesList,
        animate: true,

        defaultRenderer:
            charts.ArcRendererConfig(arcWidth: 1,arcRatio:0.1,));
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Donut Chart'),
      ),
      body: Center(
        child: Container(
          height:500,
          width: 500,
          child: chart,
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;
  final charts.Color color;
  LinearSales(this.year, this.sales,this.color);
}
