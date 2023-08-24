import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../core/utils/constants.dart';

class Charts extends StatelessWidget {
  Charts({super.key});

  final List<ChartGroupPieDataItem> data = [
    ChartGroupPieDataItem(
      amount: 5,
      color: cakeColor,
      label: 'label',
    ),
    ChartGroupPieDataItem(
      amount: 2,
      color: greenColor,
      label: 'label',
    ),
  ];

  final List<ChartLineDataItem> lines = [
    ChartLineDataItem(
      value: 1,
      x: 6,
    ),
    ChartLineDataItem(
      value: 10,
      x: 1,
    ),
    ChartLineDataItem(
      value: 2,
      x: 2,
    ),
    ChartLineDataItem(
      value: 3,
      x: 3,
    ),
    ChartLineDataItem(
      value: 40,
      x: 4,
    ),
    ChartLineDataItem(
      value: 5,
      x: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Chart(
              duration: const Duration(milliseconds: 2500),
              layers: [
                ChartGroupPieLayer(
                  items: [
                    data,
                  ],
                  settings: const ChartGroupPieSettings(
                    thickness: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Chart(
              // duration: const Duration(milliseconds: 2500),
              layers: [
                ChartLineLayer(
                  items: lines,
                  settings: const ChartLineSettings(
                    color: Colors.white,
                    thickness: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
