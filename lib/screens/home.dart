import 'package:flutter/material.dart';
import 'package:transport_commun_app/screens/mapwidget.dart';
import 'package:transport_commun_app/screens/parkingservices.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 10,
            child: Container(
              child: MapWidget(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: ParkingServices(),
            ),
          )
        ],
      ),
    );
  }
}
