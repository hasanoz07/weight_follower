import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Graph"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                    
                height: MediaQuery.of(context).size.height / 3,
                child: LineChart(
                  LineChartData(
                      maxX: 8,
                      maxY: 150,
                      minY: 30,
                      minX: 0,
                      borderData: FlBorderData(show: true, border: Border.all(color: Colors.white, width: 2)),
                      gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(color: Colors.white, strokeWidth: 1);
                          },
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(color: Colors.white, strokeWidth: 1);
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 35,
                            interval: 1,
                            getTitlesWidget: bottomTitleWidgets,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 35,
                            interval: 1,
                            getTitlesWidget: leftTitleWidgets,
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(3, 77),
                            FlSpot(4, 76.50),
                            FlSpot(5, 74.450),
                            FlSpot(6, 79),
                            FlSpot(7, 75),
                          ],
                          isCurved: false,
                          gradient: LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          barWidth: 5,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ]),
                ),
              ))
            ],
          ),
        ));
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 50:
        text = '50';
        break;
      case 90:
        text = '90';
        break;
      case 130:
        text = '130';
        break;
      default:
        return Text("");
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }