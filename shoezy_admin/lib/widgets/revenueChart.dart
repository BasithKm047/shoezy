import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/fetures/utils/const/colors.dart';
import 'package:loginpage/presentation/bloc/dashBoard_bloc/bloc/dashboard_bloc_bloc.dart';
// import 'package:shoezy_admin/fetures/utils/const/colors.dart';
// import 'package:shoezy_admin/presentation/bloc/dashBoard_bloc/bloc/dashboard_bloc_bloc.dart';

class RevenueChart extends StatelessWidget {
  // final String selectedMonth;
  // final ValueChanged<String?> onMonthChanged;
  // final List<FlSpot> salesSpots;
  // final List<FlSpot> profitSpots;

  RevenueChart({
    super.key,
    // required this.selectedMonth,
    // required this.onMonthChanged,
    // required this.salesSpots,
    // required this.profitSpots,
  });

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    context.read<DashboardBlocBloc>().add(LoadDashboardData());

    return BlocBuilder<DashboardBlocBloc, DashboardBlocState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadDashboardData: (salesSpots, profitSpots, selectedMonth) {
            final allSpots = [...salesSpots, ...profitSpots];
            final minX = allSpots
                .map((e) => e.x)
                .reduce((a, b) => a < b ? a : b);
            final maxX = allSpots
                .map((e) => e.x)
                .reduce((a, b) => a > b ? a : b);
            final minY = allSpots
                .map((e) => e.y)
                .reduce((a, b) => a < b ? a : b);
            final maxY = allSpots
                .map((e) => e.y)
                .reduce((a, b) => a > b ? a : b);
            return Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Title and Dropdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Revenue',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          width: 150,
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            focusColor: Colors.white,
                            // focusNode: FocusNode(
                            //   canRequestFocus: false,
                            //      debugLabel: 'DropdownFocusNode',
                            // ),
                            decoration: InputDecoration(
                              filled: true,

                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            value: selectedMonth,
                            onChanged: (newMonth) {
                              if (newMonth != null) {
                                context.read<DashboardBlocBloc>().add(
                                  MonthChanged(newMonth),
                                );
                              }
                            },
                            items: months.map((month) {
                              return DropdownMenuItem(
                                value: month,
                                child: Text(month),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Chart
                    AspectRatio(
                      aspectRatio: 1.8,
                      child: LineChart(
                        LineChartData(
                          minX: minX,
                          maxX: maxX,
                          minY: minY,
                          maxY: maxY,
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 5,
                                getTitlesWidget: (value, meta) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${value.toInt()}k',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 20,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    '${value.toInt()}',
                                    style: TextStyle(fontSize: 10),
                                  );
                                },
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            drawVerticalLine: false,
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: salesSpots,
                              isCurved: true,
                              color: CostumColors.salesColor,
                              barWidth: 0,
                              belowBarData: BarAreaData(
                                show: true,

                                color: CostumColors.salesColor,
                              ),
                              dotData: FlDotData(show: false),
                            ),
                            LineChartBarData(
                              spots: profitSpots,
                              isCurved: true,
                              color: CostumColors.profitcolor,
                              barWidth: 0,
                              belowBarData: BarAreaData(
                                show: true,
                                color: CostumColors.profitcolor,
                              ),
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLegendDot(
                          color: Colors.deepOrange,
                          label: 'Sales',
                        ),
                        SizedBox(width: 16),
                        _buildLegendDot(color: Colors.purple, label: 'Profit'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          orElse: () {
            return Center(child: Text('No data available'));
          },
        );
      },
    );
  }

  Widget _buildLegendDot({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
