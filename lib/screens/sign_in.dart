import 'package:flutter/material.dart';
import 'package:transport_commun_app/main.dart';
import 'package:transport_commun_app/screens/home.dart';
import 'package:transport_commun_app/screens/mapwidget.dart';
import 'package:transport_commun_app/screens/parkingservices.dart';
import 'package:transport_commun_app/screens/register.dart';
import 'package:transport_commun_app/shared/constants.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool loading = false;

  //text filed state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          elevation: 0.0,
          title: Text('Sign-in To E-Bus'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => Register()));
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
                          val!.isEmpty ? 'Enter an email' : null,
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
                      validator: (String? val) => val!.length < 6
                          ? 'enter a password 6+ char long'
                          : null,
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
                      child: Text('Sign In '),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  ],
                ))),
          ],
        ));
  }
}
