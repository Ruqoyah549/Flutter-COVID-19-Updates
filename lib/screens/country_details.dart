import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_home/constants.dart';
import 'package:stay_home/models/country.dart';
import 'package:stay_home/models/world_data.dart';
import 'package:stay_home/widgets/format_date.dart';
import 'package:stay_home/widgets/format_time.dart';
import 'package:stay_home/widgets/my_text.dart';

class CountryDetails extends StatefulWidget {
  final Country country;

  CountryDetails({this.country});

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    final details = Provider.of<WorldData>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '${widget.country.countryName}' ?? 'Loading...',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 15.0,
              ),
              height: 200.0,
              width: double.infinity,
              decoration: kContainerDecoration,
              child: Column(
                children: <Widget>[
                  Text(
                    'Statistics Taken At',
                    style: TextStyle(color: Colors.white),
                  ),
                  FormatDate(dateString: '${details.allCountryRecordDate}'),
                  FormatTime(timeString: '${details.allCountryRecordDate}'),
                ],
              ),
            ),
            Positioned(
              top: 100.0,
              right: 0.0,
              left: 0.0,
              child: Flex(
                mainAxisSize: MainAxisSize.min,
                direction: Axis.vertical,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(20.0),
                      width: double.infinity,
                      height: 500.0,
                      child: Column(
                        children: <Widget>[
                          Text('Total Case(s)',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(text: '${widget.country.totalCases}'),
                          SizedBox(height: 15.0),
                          Text('Total Deaths',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(
                            text: '${widget.country.totalDeaths}',
                            color: Colors.redAccent,
                          ),
                          SizedBox(height: 15.0),
                          Text('Total Recovered',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(
                            text: '${widget.country.totalRecovered}',
                            color: Colors.green,
                          ),
                          SizedBox(height: 15.0),
                          Text('Active Case(s)',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(text: '${widget.country.activeCases}'),
                          SizedBox(height: 15.0),
                          Text('New Case(s)', style: TextStyle(fontSize: 16.0)),
                          MyText(text: '${widget.country.newCases}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
