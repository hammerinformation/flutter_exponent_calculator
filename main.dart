import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

var number = new TextEditingController();
var power = new TextEditingController();
int result = 0;
double _height = 22;
/// https://github.com/hammerinformation/flutter_exponent_calculator
void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Exponent Calculator"),
        backgroundColor: Color.lerp(Colors.blue, Colors.black, .5),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.deepOrange])),
            child: (Column(
              children: <Widget>[
                SizedBox(
                  height: _height + 40,
                ),
                CupertinoTextField(
                  keyboardType: TextInputType.number,
                  controller: number,
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.white),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  placeholder: "Number",
                  placeholderStyle: (TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: _height,
                ),
                CupertinoTextField(
                  keyboardType: TextInputType.number,
                  controller: power,
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.white),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  placeholder: "Power",
                  placeholderStyle: (TextStyle(
                    color: Colors.black,
                  )),
                ),
                SizedBox(
                  height: _height,
                ),
                CupertinoButton(
                  child: Text("Calculate"),
                  color: Colors.black,
                  //textColor: Colors.white,
                  onPressed: () {
                    var n = int.parse(number.text);
                    var p = int.parse(power.text);

                    result = pow(n, p);
                    number.clear();
                    power.clear();
                    var alert = new CupertinoAlertDialog(
                      title: Text(
                        "Result:",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      content: Text(result.toString(),
                          style: TextStyle(color: Colors.black87, fontSize: 15)),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                    showDialog(
                        context: context, builder: (BuildContext context) => alert);
                  },
                ),
              ],
            )),
          )),
    );
  }
}
