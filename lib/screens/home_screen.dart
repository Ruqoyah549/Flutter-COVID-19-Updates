import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_home/constants.dart';
import 'package:stay_home/models/country.dart';
import 'package:stay_home/models/world_data.dart';
import 'package:stay_home/screens/country_details.dart';
import 'package:stay_home/screens/nigeria_details.dart';
import 'package:stay_home/screens/world_details.dart';
import 'package:stay_home/widgets/card_widget.dart';
import 'package:stay_home/widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<WorldData>(context).getWorldStat();
    Provider.of<WorldData>(context).getNigeriaStat();
    Provider.of<WorldData>(context).getAllCountry();
    final world = Provider.of<WorldData>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: world.fetching
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Get Real-time', style: kTitleTextStyle),
                        Text('Updates on COVID19', style: kTitleTextStyle),
                        SizedBox(height: 15.0),
                        SearchField(),
                        SizedBox(height: 10.0),
                        CardWidget(
                          title: 'World Total Stat',
                          image: 'assets/images/globe.svg',
                          cases: world.totalCases,
                          deaths: world.totalDeaths,
                          recovered: world.totalRecovered,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorldDetails()));
                          },
                        ),
                        CardWidget(
                          title: 'Nigeria Stat',
                          image: 'assets/images/nigerian.png',
                          cases: world.countryTotalCases,
                          deaths: world.countryTotalDeaths,
                          recovered: world.countryTotalRecovered,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NigeriaDetails()));
                          },
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
//                    Text('All Countries'),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: world.allCountries.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  world.allCountries[index]['country_name'],
                                  style: TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  '${world.allCountries[index]['cases']} Case(s)',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Deaths: ${world.allCountries[index]['deaths']}',
                                  style: TextStyle(
//                                    fontSize: 17.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  'Total Recovered: ${world.allCountries[index]['total_recovered']}',
                                  style: TextStyle(
//                                    fontSize: 17.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Country country = Country(
                                countryName: world.allCountries[index]
                                    ['country_name'],
                                totalCases: world.allCountries[index]['cases'],
                                totalDeaths: world.allCountries[index]
                                    ['deaths'],
                                totalRecovered: world.allCountries[index]
                                    ['total_recovered'],
                                newCases: world.allCountries[index]
                                    ['new_cases'],
                                activeCases: world.allCountries[index]
                                    ['active_cases'],
                              );
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return CountryDetails(country: country);
                              }));
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
