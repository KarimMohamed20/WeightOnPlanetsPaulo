import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _planetsControl = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = '';
    void handleRadioValueChanges(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_planetsControl.text, 0.06);
          _formattedText = "Your Weight On Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_planetsControl.text, 0.38);
          _formattedText = "Your Weight On Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_planetsControl.text, 0.91);
          _formattedText = "Your Weight On Venus is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 3:
          _finalResult = calculateWeight(_planetsControl.text,2.34);
          _formattedText = "Your Weight On Jupiter is ${_finalResult.toStringAsFixed(1)}";

       }
    }
  );
}
             @override
             Widget build(BuildContext context) {
               return Scaffold(
                 // My Top AppBar
                 appBar: new AppBar(
                     title: new Text("Weight On Planet X"),
                     centerTitle: true,
                     backgroundColor: Colors.black38,
                     elevation: 3.0),
                 body: new Container(
                   alignment: Alignment.topCenter,
                   child: new ListView(
                     children: <Widget>[
                       // Planets Logo
                       new Image.asset(
                         'lib/images/planetsLogo.png',
                         height: 133.0,
                         width: 200.0,
                       ),
                       new Container(
                         margin: new EdgeInsets.all(3.0),
                         alignment: Alignment.center,
                         child: new Column(
                           children: <Widget>[
                             new TextField(
                               controller: _planetsControl,
                               keyboardType: TextInputType.number,
                               decoration: new InputDecoration(
                                   labelText: 'Your Weight On Earth',
                                   hintText: 'In Pounds',
                                   icon: new Icon(Icons.person_outline)),
                             ),
                             new Padding(
                               padding: EdgeInsets.all(5.0),
                             ),
                             new Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
           
                                 // First Radio
                                 new Radio<int>(
                                   value: 0,
                                   groupValue: radioValue,
                                   onChanged: handleRadioValueChanges,
                                   activeColor: Colors.brown[700],
                                 ),
                                 new Text(
                                   'Pluto',
                                   style: new TextStyle(color: Colors.black),
                                 ),
           
                                 // Second Radio
                                 new Radio<int>(
                                   value: 1,
                                   groupValue: radioValue,
                                   onChanged: handleRadioValueChanges,
                                   activeColor: Colors.red,
                                 ),
                                 new Text(
                                   'Mars',
                                   style: new TextStyle(color: Colors.black),
                                 ),
                                 // Three Radio
                                 new Radio<int>(
                                   value: 2,
                                   groupValue: radioValue,
                                   onChanged: handleRadioValueChanges,
                                   activeColor: Colors.orangeAccent,
                                 ),
                                 new Text(
                                   'Venus',
                                   style: new TextStyle(color: Colors.black),
                                 ),
                                 new Radio<int>(
                                   value: 3,
                                   groupValue: radioValue,
                                   onChanged: handleRadioValueChanges,
                                   activeColor: Colors.orange[800],
                                 ),
                                 new Text(
                                   'Jupiter',
                                   style: new TextStyle(color: Colors.black),
                                 ),
                               ],
                             ),
                             new Padding(
                               padding: const EdgeInsets.all(15.6),
                             ),
                              // Result Text
           
                                 new Text(
                                   _planetsControl.text.isEmpty ? "Please enter weight" : _formattedText +" lbs",
                                   style: new TextStyle(
                                     color: Colors.white,
                                     fontSize: 19.4,
                                     fontWeight: FontWeight.w500
                                     ),
                                 )
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
                 // App Wallpaper
                 backgroundColor: Colors.blueGrey,
               );
             }
           
             double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty &&  int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    } else {
      _formattedText = "Wrong Try To Enter Another Number";
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }

  }
}
