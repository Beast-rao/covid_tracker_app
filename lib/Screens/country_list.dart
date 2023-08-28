import 'package:covid_tracker/Screens/country_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Services/stat_services.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchcontroller,
              // onChanged: (){setState(() {});}, it will not work like this as we have to mention same value in parameter
              onChanged: (val) {
                setState(() {

                });
              },
              decoration: InputDecoration(
                hintText: "Search country name",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                contentPadding: EdgeInsets.symmetric(horizontal: 22),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: statsServices.covidCountriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      // itemCount: snapshot.data!.length, like this it will give error for it use like that
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade600,
                            highlightColor: Colors.grey.shade500,
                            //for shimmer effect
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                  title: Container(
                                    height: 20,
                                    width: 80,
                                  ),
                                  subtitle: Container(
                                    height: 20,
                                    width: 80,
                                  ),
                                  trailing: Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 30,
                                      ),
                                      Container(
                                        height: 10,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // string to get search item
                          String countryName = snapshot.data![index]["country"];

                          if (searchcontroller.text.isEmpty) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetails(country: snapshot
                                                .data![index]['country'],
                                                flag: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                                cases: snapshot
                                                    .data![index]['cases'],
                                                todayCases: snapshot
                                                    .data![index]['todayCases'],
                                                deaths: snapshot
                                                    .data![index]['deaths'],
                                                todayDeaths: snapshot
                                                    .data![index]['todayDeaths'],
                                                recovered: snapshot
                                                    .data![index]['recovered'],
                                                todayRecovered: snapshot
                                                    .data![index]['todayRecovered'],
                                                active: snapshot
                                                    .data![index]['active'],
                                                critical: snapshot
                                                    .data![index]['critical'],
                                                tests: snapshot
                                                    .data![index]['tests'],
                                              population:snapshot
                                                  .data![index]['population'],
                                            )));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag']),
                                    ),
                                    title: Text(
                                        snapshot.data![index]['country']),
                                    subtitle: Text(
                                        snapshot.data![index]['cases']
                                            .toString()),
                                    trailing: Column(
                                      children: [
                                        Text('Deaths'),
                                        Text(snapshot.data![index]['deaths']
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (countryName
                              .toLowerCase()
                              .contains(searchcontroller.text.toLowerCase())) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetails(country: snapshot
                                                .data![index]['country'],
                                              flag: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                              cases: snapshot
                                                  .data![index]['cases'],
                                              todayCases: snapshot
                                                  .data![index]['todayCases'],
                                              deaths: snapshot
                                                  .data![index]['deaths'],
                                              todayDeaths: snapshot
                                                  .data![index]['todayDeaths'],
                                              recovered: snapshot
                                                  .data![index]['recovered'],
                                              todayRecovered: snapshot
                                                  .data![index]['todayRecovered'],
                                              active: snapshot
                                                  .data![index]['active'],
                                              critical: snapshot
                                                  .data![index]['critical'],
                                              tests: snapshot
                                                  .data![index]['tests'],
                                              population:snapshot
                                                  .data![index]['population'],
                                            )));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag']),
                                    ),
                                    title: Text(
                                        snapshot.data![index]['country']),
                                    subtitle: Text(
                                        snapshot.data![index]['cases']
                                            .toString()),
                                    trailing: Column(
                                      children: [
                                        Text('Deaths'),
                                        Text(snapshot.data![index]['deaths']
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
