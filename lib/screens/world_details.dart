import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_home/constants.dart';
import 'package:stay_home/models/world_data.dart';
import 'package:stay_home/widgets/format_date.dart';
import 'package:stay_home/widgets/format_time.dart';
import 'package:stay_home/widgets/my_text.dart';

class WorldDetails extends StatelessWidget {
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
          'World Total Stat',
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
                  FormatDate(dateString: '${details.recordDateTime}'),
                  FormatTime(timeString: '${details.recordDateTime}'),
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
                          MyText(text: '${details.totalCases}'),
                          SizedBox(height: 15.0),
                          Text('Total Death(s)',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(
                            text: '${details.totalDeaths}',
                            color: Colors.redAccent,
                          ),
                          SizedBox(height: 15.0),
                          Text('Total Recovered',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(
                            text: '${details.totalRecovered}',
                            color: Colors.green,
                          ),
                          SizedBox(height: 15.0),
                          Text('New Case(s)', style: TextStyle(fontSize: 16.0)),
                          MyText(text: '${details.newCases}'),
                          SizedBox(height: 15.0),
                          Text('New Death(s)',
                              style: TextStyle(fontSize: 16.0)),
                          MyText(text: '${details.newDeaths}'),
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
