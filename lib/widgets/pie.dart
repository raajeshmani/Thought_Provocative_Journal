import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../theme_data.dart';
import 'dart:math' as math;

class Pie extends StatefulWidget {
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  Map<String, double> dataMap = new Map();

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("surprised", () => 5);
    dataMap.putIfAbsent("happy", () => 3);
    dataMap.putIfAbsent("sad", () => 2);
    dataMap.putIfAbsent("disgusted", () => 4);
    dataMap.putIfAbsent("angry", () => 6);
    dataMap.putIfAbsent("fearful", () => 1);
    dataMap.putIfAbsent("bad", () => 8);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PieChart(
          dataMap: dataMap, //Required parameter
          legendFontColor: Colors.blueGrey[900],
          legendFontSize: 14.0,
          legendFontWeight: FontWeight.w500,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 2.7,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: true,
          chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
          colorList: Ui.colorList,
          showLegends: true,
          initialAngle: math.pi * 0.5,
        ),
      ),
    );
  }
}
