import 'package:covid_tracker/Services/stat_services.dart';
import 'package:covid_tracker/Widgets/reuseable_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Model/CovidWorldStats.dart';
import 'country_list.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 5), vsync: this)
        ..repeat();

  @override
  // dispose the splash screen after animation
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Colors.green,
    Colors.red,
    CupertinoColors.activeBlue
  ];

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // we can use media queries for responsiveness like GetX
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // we have api name in future that we created in statservices and in AsyncSnapshot<CovidWorldStats> it is model of api
            FutureBuilder(
                future: statsServices.covidWorldStatsRecord(),
                builder: (context, AsyncSnapshot<CovidWorldStats> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      // we can change our spin   kit according to our requirements
                      child: SpinKitCircle(
                        color: Colors.grey.withOpacity(0.8),
                        controller: _controller,
                        size: 60,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Death":
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          animationDuration: Duration(milliseconds: 1300),
                          colorList: colorList,
                          // list of array that we created above
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.right),
                          // we are doing this to show chat values in percetage
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          // chartType: ChartType.ring,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            // color:CupertinoColors.systemGrey6.withOpacity(0.3),
                            color: CupertinoColors.tertiarySystemGroupedBackground,
                            child: Column(
                              children: [
                                ReusableWidget(
                                    name: "Total",
                                    value: snapshot.data!.cases.toString()),
                                ReusableWidget(
                                    name: "Recovered",
                                    value: snapshot.data!.recovered.toString()),
                                ReusableWidget(
                                    name: "Critical",
                                    value: snapshot.data!.recovered.toString()),
                                ReusableWidget(
                                    name: "Death",
                                    value: snapshot.data!.deaths.toString()),
                                ReusableWidget(
                                    name: "Today Death",
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                ReusableWidget(
                                    name: "Today Recorded",
                                    value:
                                        snapshot.data!.todayCases.toString()),
                                ReusableWidget(
                                    name: "Active Cases",
                                    value: snapshot.data!.active.toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryList()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              // color: CupertinoColors.systemGrey6.withOpacity(0.6),
                              color: CupertinoColors.tertiarySystemGroupedBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: Text(
                              "Track Countries",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
