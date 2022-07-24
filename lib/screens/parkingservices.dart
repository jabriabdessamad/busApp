import 'package:flutter/material.dart';
import 'package:transport_commun_app/screens/findbus.dart';

class ParkingServices extends StatefulWidget {
  const ParkingServices({Key? key}) : super(key: key);

  @override
  _ParkingServicesState createState() => _ParkingServicesState();
}

class _ParkingServicesState extends State<ParkingServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.directions_bus),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FindBus()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'find Bus',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.history),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Bus history',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.star),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'favorite Bus',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
