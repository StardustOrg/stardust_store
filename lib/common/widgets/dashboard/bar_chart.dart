import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stardust_store/utils/constants/colors.dart';

class AdaptiveChart extends StatelessWidget {
  final String periodType; // 'month' ou 'week'
  final List<Map<String, dynamic>> data;
  final Color barColor;
  final String chartType; // 'bar' ou 'line'

  const AdaptiveChart({
    Key? key,
    required this.periodType,
    required this.data,
    this.barColor = StarColors.starTeal,
    this.chartType = 'bar',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(16),
      child: chartType == 'bar' ? _buildBarChart() : _buildLineChart(),
    );
  }

  // Método para construir o BarChart com margem
  BarChart _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barGroups: _generateBarGroups(),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black, width: 1),
        ),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                if (value.toInt() < data.length) {
                  return Text(
                    periodType == 'week'
                        ? _getWeekdayLabel(data[value.toInt()]['day'])
                        : '${data[value.toInt()]['day']}',
                    style: const TextStyle(fontSize: 12),
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
        maxY:
            _getMaxYValueWithMargin(), // Define o valor máximo para o eixo Y com margem
      ),
      swapAnimationDuration: const Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  // Método para construir o LineChart
  LineChart _buildLineChart() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black, width: 1),
        ),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                if (value.toInt() < data.length) {
                  return Text(
                    periodType == 'week'
                        ? _getWeekdayLabel(data[value.toInt()]['day'])
                        : '${data[value.toInt()]['day']}',
                    style: const TextStyle(fontSize: 12),
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: _generateLineSpots(),
            isCurved: false, // Torna as linhas retas
            color: barColor,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: false,
            ),
            dotData: FlDotData(show: false),
          ),
        ],
        minY: 0, // Define o valor mínimo para o eixo Y
        maxY: _getMaxYValue() +
            50, // Define o valor máximo para o eixo Y com uma margem
      ),
    );
  }

  // Gera os grupos de barras para o BarChart
  List<BarChartGroupData> _generateBarGroups() {
    return data.asMap().entries.map((entry) {
      int index = entry.key;
      Map<String, dynamic> item = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: item['value'],
            color: barColor,
            borderRadius: BorderRadius.circular(2),
            width: 15,
          )
        ],
      );
    }).toList();
  }

  // Método para obter o valor máximo do eixo Y com margem
  double _getMaxYValueWithMargin() {
    double maxY = _getMaxYValue();
    return maxY + (maxY * 0.1); // Adiciona 10% de margem ao valor máximo
  }

  // Gera os pontos para o LineChart
  List<FlSpot> _generateLineSpots() {
    return data.asMap().entries.map((entry) {
      int index = entry.key;
      Map<String, dynamic> item = entry.value;
      return FlSpot(index.toDouble(), item['value'].toDouble());
    }).toList();
  }

  // Método para obter o valor máximo do eixo Y
  double _getMaxYValue() {
    return data
        .map((item) => item['value'] as double)
        .reduce((a, b) => a > b ? a : b);
  }

  // Método para converter índice de dia da semana em nome
  String _getWeekdayLabel(int day) {
    switch (day) {
      case 1:
        return 'Seg';
      case 2:
        return 'Ter';
      case 3:
        return 'Qua';
      case 4:
        return 'Qui';
      case 5:
        return 'Sex';
      case 6:
        return 'Sab';
      case 7:
        return 'Dom';
      default:
        return '';
    }
  }
}
