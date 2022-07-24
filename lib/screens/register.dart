import 'package:flutter/material.dart';
import 'package:transport_commun_app/screens/sign_in.dart';
import 'package:transport_commun_app/shared/constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //text filed state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          elevation: 0.0,
          title: Text('Sign-up For E-Bus'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => SignIn()));
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bus.png'), fit: BoxFit.cover)),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'email'),
                      validator: (String? val) =>
                          val!.isEmpty ? 'Enter An Email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      validator: (String? val) =>
                          val!.length < 6 ? 'enter a 6 plus charachter' : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text('Register '),
                      onPressed: () {},
                    ),
                  ],
                ))),
          ],
        ));
  }
}
