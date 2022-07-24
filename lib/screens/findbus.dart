import 'package:flutter/material.dart';
import 'package:transport_commun_app/screens/listviewitems.dart';

class FindBus extends StatefulWidget {
  FindBus({
    Key? key,
  }) : super(key: key);

  @override
  _FindBusState createState() => _FindBusState();
}

class _FindBusState extends State<FindBus> {
  final List<Map<String, dynamic>> _allParking = [
    {
      "id": 1,
      "categorie": "cheapest",
      "parkingName": 'Terminus Rabat Sa',
      "adresse": 'Place Mamounia Hassan-Rabat',
      "distance": '100',
      "lat": 34.0202,
      "long": -6.8402
    },
    {
      "id": 2,
      "categorie": "cheapest",
      "parkingName": 'Terminus Ibn Sina',
      "adresse": '2 Av. Ibn Sina, Rabat 10070 ',
      "distance": '200',
      "lat": 33.9976,
      "long": -6.8536
    },
    {
      "id": 3,
      "categorie": "cheapest",
      "parkingName": 'Terminus Bab Al Had',
      "adresse": 'Bab Al Had - Rabat ',
      "distance": '1000',
      "lat": 34.0281,
      "long": -6.8397
    },
    {
      "id": 4,
      "categorie": "nearest",
      "parkingName": 'Terminus Hassan ',
      "adresse": '2 Av. Hassan, Rabat 10070 ',
      "distance": '700',
      "lat": 33.988,
      "long": -6.8513
    },
    {
      "id": 5,
      "categorie": "nearest",
      "parkingName": 'Terminus Takkaddoum',
      "adresse": 'Av. TakkadoumRabat',
      "distance": '800',
      "lat": 34.0107,
      "long": -6.8459
    },
    {
      "id": 6,
      "categorie": "nearest",
      "parkingName": 'Terminus  Mega mall',
      "adresse": 'Place Mamounia Hassan - Rabat ',
      "distance": '1000',
      "lat": 34.0202,
      "long": -6.8402
    },
    {
      "id": 7,
      "categorie": "available",
      "parkingName": 'Terminus Souissi',
      "adresse": '2 Av. Ibn Sina, Rabat 10070 ',
      "distance": '4000',
      "lat": 33.9976,
      "long": -6.8536
    },
    {
      "id": 8,
      "categorie": "available",
      "parkingName": 'Terminus  Bab Al Had',
      "adresse": 'Bab Al Had - Rabat ',
      "distance": '4500',
      "lat": 34.0241,
      "long": -6.8416
    },
    {
      "id": 9,
      "categorie": "available",
      "parkingName": 'Terminus  bettana ',
      "adresse": '2 Av. Ibn Sina, Rabat 10070',
      "distance": '2500',
      "lat": 33.988,
      "long": -6.8513
    },
    {
      "id": 10,
      "categorie": "available",
      "parkingName": 'Terminus , Avenue Annasr, Rabat',
      "adresse": 'Av. AnnasrRabat',
      "distance": '800',
      "lat": 34.0107,
      "long": -6.8459
    },
  ];
  String Categorie = "";
  bool nearestPressed = false;
  bool cheapestpressed = false;
  bool availablepressed = false;

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundParking = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundParking = _allParking;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String chosenCategorie) {
    List<Map<String, dynamic>> results = [];
    if (chosenCategorie == "") {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allParking;
    } else {
      results =
          _allParking.where((user) => user["categorie"] == Categorie).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundParking = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Bus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '${_foundParking.length} Buses Found ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: !nearestPressed ? Colors.grey : Colors.indigo[900],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 35,
                  width: 90,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        nearestPressed = true;
                        cheapestpressed = false;
                        availablepressed = false;
                        Categorie = "nearest";
                        _runFilter(Categorie);
                      });
                    },
                    child: Text(
                      'Nearest',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color:
                          !cheapestpressed ? Colors.grey : Colors.indigo[900],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 35,
                  width: 90,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        nearestPressed = false;
                        cheapestpressed = true;
                        availablepressed = false;
                        Categorie = "cheapest";
                        _runFilter(Categorie);
                      });
                    },
                    child:
                        Text('Cheapest', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color:
                          !availablepressed ? Colors.grey : Colors.indigo[900],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 35,
                  width: 90,
                  child: TextButton(
                    onPressed: () {
                      nearestPressed = false;
                      cheapestpressed = false;
                      availablepressed = true;
                      setState(() {
                        Categorie = "available";
                        _runFilter(Categorie);
                      });
                    },
                    child: Text('Available',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundParking.isNotEmpty
                  ? ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 300, minHeight: 200),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _foundParking.length,
                        itemBuilder: (context, index) => Card(
                            key: ValueKey(_foundParking[index]["id"]),
                            color: Colors.grey[200],
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ParkingItems(
                              _foundParking[index]["parkingName"],
                              _foundParking[index]["distance"],
                              _foundParking[index]["adresse"],
                              _foundParking[index]["lat"],
                              _foundParking[index]["long"],
                            )),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
