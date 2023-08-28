import 'package:covid_tracker/Widgets/reuseable_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  // create string and integers according to API through Postman json
  final String country;
  final String flag;
  final int cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      tests,
      population;

  const CountryDetails(
      {super.key,
      required this.country,
      required this.flag,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.tests,
      required this.population});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.country,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.068),
                  child: Card(
                    color: CupertinoColors.tertiarySystemGroupedBackground,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ReusableWidget(
                            name: "Total Cases",
                            value: widget.cases.toString()),
                        ReusableWidget(
                            name: "Today Cases",
                            value: widget.todayCases.toString()),
                        ReusableWidget(
                            name: "Recovered",
                            value: widget.recovered.toString()),
                        ReusableWidget(
                            name: "Total Recovered",
                            value: widget.cases.toString()),
                        ReusableWidget(
                            name: "Tests", value: widget.tests.toString()),
                        ReusableWidget(
                            name: "Active", value: widget.active.toString()),
                        ReusableWidget(
                            name: "Deaths", value: widget.deaths.toString()),
                        ReusableWidget(
                            name: "Today Deaths",
                            value: widget.todayDeaths.toString()),
                        ReusableWidget(
                            name: "Critical",
                            value: widget.critical.toString()),
                        ReusableWidget(
                            name: "Population",
                            value: widget.population.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(widget.flag),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Soon We will Defeat Covid\nBe Strong",
              textAlign:TextAlign.center ,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
