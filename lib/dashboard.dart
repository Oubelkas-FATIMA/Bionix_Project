import 'package:bionixapp/textHandler.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'app_colors.dart';
import 'httpReqs.dart';

TextEditingController search = TextEditingController();

class dashBoard extends StatefulWidget {
  const dashBoard({Key? key}) : super(key: key);

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.02.sh,
        ),
        Container(
          width: 0.76.sw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 0.01.sw,
              ),
              const Icon(Icons.dashboard, color: Color(0xFF939598)),
              SizedBox(
                width: 0.01.sw,
              ),
              GilroyText(
                  text: "Dashboard", size: 20, color: const Color(0xFF939598)),
              SizedBox(
                width: 0.04.sw,
              ),
              Flexible(
                child: Container(
                  child: CustomSearchTextField(
                    width: 1.sw,
                    height: 0.06.sh,
                    textController: search,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 0.02.sh,
        ),
        Container(
          width: 0.76.sw,
          child: Row(
            children: [
              SizedBox(
                width: 0.01.sw,
              ),
              Flexible(
                child: Column(
                  children: [
                    // Power Consumption Container
                    Container(
                      color: Colors.white,
                      height: 0.275.sh,
                      child: const Expanded(
                        child: LineChart2(),
                      ),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    // Tower Overview
                    Container(
                      color: Colors.white,
                      height: 0.475.sh,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: (0.01.sh).w,
              ),
              // Weather and Nutriments
              Container(
                color: Colors.white,
                height: 0.76.sh,
                width: 0.25.sw,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      GilroyText(text: "Weather Data", size: 22),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0.01.sw, vertical: 0.005.sh),
                        color: const Color(0xFF939598),
                        height: 0.001.sh,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const LinearProgress(
                        parameter: 1,
                        color: Colors.red,
                        unit: " °C",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const LinearProgress(
                        parameter: 2,
                        color: Colors.blue,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const LinearProgress(
                        parameter: 3,
                        color: Colors.brown,
                        unit: " hPa",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const LinearProgress(
                        parameter: 4,
                        color: Colors.green,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.04.sh,
                      ),
                      GilroyText(text: "Nutriments Proportion", size: 22),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0.01.sw, vertical: 0.005.sh),
                        color: const Color(0xFF939598),
                        height: 0.001.sh,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 1,
                        color: Colors.red,
                        unit: " °C",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 2,
                        color: Colors.blue,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 3,
                        color: Colors.brown,
                        unit: " hPa",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 4,
                        color: Colors.green,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 1,
                        color: Colors.red,
                        unit: " °C",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 2,
                        color: Colors.blue,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 3,
                        color: Colors.brown,
                        unit: " hPa",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 4,
                        color: Colors.green,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 4,
                        color: Colors.green,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const NutrimentProgress(
                        parameter: 4,
                        color: Colors.green,
                        unit: "%",
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomSearchTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController textController;

  const CustomSearchTextField({
    super.key,
    required this.width,
    required this.height,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        controller: textController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 0.01.sh, vertical: 0.005.sw),
          hintText: 'Search...',
          hintStyle: TextStyle(
            fontSize: 22.sp,
            fontFamily: "Gilroy",
            color: const Color(0xFF939598),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF939598),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class LinearProgress extends StatefulWidget {
  const LinearProgress(
      {Key? key,
      required this.parameter,
      required this.color,
      required this.unit})
      : super(key: key);
  final int parameter;
  final Color color;
  final String unit;
  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  int x = 0;
  String text = '';
  String parameter = '';
  String value = '';
  double y = 1.0;
  @override
  Widget build(BuildContext context) {
    switch (widget.parameter) {
      case 1:
        text = "Temperature :";
        parameter = "Temp";
        x = 25;
      case 2:
        text = "Humidity :";
        parameter = "Hum";
        x = 10;
      case 3:
        text = "Pressure :";
        parameter = "Pr";
        y = 0.05;
        x = 0;
      case 4:
        text = "Air Quality :";
        parameter = "Aqi";
        x = 0;
      default:
        text = "Temperature :";
        parameter = "Temp";
        x = 25;
    }
    return FutureBuilder(
        future: fetchAverage(sessionToken, parameter),
        builder: (context, snap) {
          if (snap.hasData) {
            value = snap.data ?? "Nan";
          }
          return snap.hasData
              ? Container(
                  width: 0.25.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.01.sw,
                      ),
                      Container(
                          width: 0.06.sw,
                          child: GilroyText(text: text, size: 14)),
                      SizedBox(
                        width: 0.01.sw,
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(0.005.sh)),
                        child: Container(
                          width: 0.1.sw,
                          height: 0.01.sh,
                          color: const Color(0xFF939598),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            //

                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.005.sh)),
                              child: Container(
                                height: 1.sh,
                                width: 1.sw,
                                color: widget.color,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.01.sw,
                      ),
                      SizedBox(
                        width: 0.05.sw,
                        child: GilroyText(
                            text:
                                "${value.length >= 4 ? value.substring(0, 4) : value} ${widget.unit}",
                            size: 14),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 0.03.sh, child: const CircularProgressIndicator());
        });
  }
}

class NutrimentProgress extends StatefulWidget {
  const NutrimentProgress(
      {Key? key,
      required this.parameter,
      required this.color,
      required this.unit})
      : super(key: key);
  final int parameter;
  final Color color;
  final String unit;
  @override
  State<NutrimentProgress> createState() => _NutrimentProgressState();
}

class _NutrimentProgressState extends State<NutrimentProgress> {
  int x = 0;
  String text = '';
  String parameter = '';
  String value = '';

  @override
  Widget build(BuildContext context) {
    switch (widget.parameter) {
      case 1:
        text = "Phospohrus :";
        parameter = "Phs";
        x = 25;

      case 2:
        text = "Molybdenum :";
        parameter = "Mol";
        x = 10;

      case 3:
        text = "Pressure :";
        parameter = "Pr";

        x = 0;
      case 4:
        text = "Nitrogen :";
        parameter = "Nit";
        x = 0;
      case 5:
        text = "Calcium :";
        parameter = "Cal";
        x = 25;
      case 6:
        text = "Magnesium :";
        parameter = "Mag";
        x = 25;
      case 7:
        text = "Sulfur :";
        parameter = "Sul";
        x = 25;
      case 8:
        text = "Iron :";
        parameter = "Iron";
        x = 25;
      case 9:
        text = "Copper :";
        parameter = "Cop";
        x = 25;
      case 10:
        text = "zinc :";
        parameter = "Zinc";
        x = 25;
      case 11:
        text = "Boron :";
        parameter = "Bor";
        x = 25;
      default:
        text = "Calcium :";
        parameter = "Cal";
        x = 25;
    }
    return FutureBuilder(
        future: fetchAverage(sessionToken, parameter),
        builder: (context, snap) {
          if (snap.hasData) {
            value = snap.data ?? "Nan";
          }
          return snap.hasData
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 0.001.sh),
                  width: 0.25.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.01.sw,
                      ),
                      // SizedBox(
                      //   width: 0.01.sw,
                      // ),
                      Container(
                          width: 0.06.sw,
                          child: GilroyText(text: text, size: 14)),

                      SizedBox(
                        width: 0.03.sw,
                      ),

                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.010.sh)),
                            child: Container(
                              width: 0.1.sw,
                              height: 0.02.sh,
                              color: const Color(0xFF939598),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                // widthFactor: ((double.parse(value) * x) / 100),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(0.010.sh)),
                                  child: Container(
                                    height: 1.sh,
                                    width: 1.sw,
                                    color: widget.color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 0.01.sw,
                          // ),
                          // SizedBox(
                          //   width: 0.05.sw,
                          //   child: GilroyText(
                          //       text:
                          //           "${value.length >= 4 ? value.substring(0, 4) : value} ${widget.unit}",
                          //       size: 14),
                          // ),

                          Positioned.fill(
                              child: Align(
                            alignment:
                                Alignment.centerRight, // Align to the left
                            child: Text(
                              "${value.length >= 4 ? value.substring(0, 4) : value} ${widget.unit}",
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 0.03.sh, child: const CircularProgressIndicator());
        });
  }
}
// ignore: slash_for_doc_comments
/**
    EdgeInsets.only(
    right: (value.contains('NaN'))
    ? width 
    : width *
    (1 -
    ((double.parse(value) * y + x) /
    100)))
 */

class LineChart2 extends StatefulWidget {
  const LineChart2({super.key});

  @override
  State<LineChart2> createState() => _LineChart2State();
}

class _LineChart2State extends State<LineChart2> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData("Junary", 10),
      SalesData("March", 28),
      SalesData("July", 34),
      SalesData("august", 50),
    ];

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(

                    // Enable legend
                    // legend: const Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: _tooltipBehavior,
                    title: ChartTitle(
                        text: 'Power Consumption',
                        textStyle: const TextStyle(
                            color: Color(0xFF939598), fontSize: 22)),
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(width: 0)),
                    series: <ChartSeries>[
          // Renders line chart
          LineSeries<SalesData, String>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                color: Colors.green, // Set the background color
                borderWidth: 1.0, // Adjust the border width as needed
                borderColor: Colors.black,
              ))
          // Enable data label
        ]))));
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
