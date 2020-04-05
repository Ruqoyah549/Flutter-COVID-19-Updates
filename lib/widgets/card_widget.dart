import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String cases;
  final String deaths;
  final String recovered;
  final String title;
  final Function function;

  CardWidget(
      {this.image,
      this.recovered,
      this.deaths,
      this.cases,
      this.title,
      this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 130.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: GestureDetector(
        onTap: function,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Image(
                  image: AssetImage(image ?? 'assets/images/globe.svg'),
                  width: 100,
                  height: 100,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                      child: Text(
                    title,
                    style: TextStyle(fontSize: 22.0),
                  )),
                  SizedBox(height: 5.0),
                  Flexible(child: Text('Total Cases: $cases')),
                  SizedBox(height: 3.0),
                  Flexible(
                      child: Text(
                    'Total Deaths: $deaths',
                    style: TextStyle(color: Colors.redAccent),
                  )),
                  SizedBox(height: 3.0),
                  Flexible(
                      child: Text(
                    'Total Recovered: $recovered',
                    style: TextStyle(color: Colors.green),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
