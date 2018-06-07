import 'package:flutter/material.dart';
import 'package:weight_on_planets/ui/home.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Weights On Planets',
    home: new Home(),
    theme: new ThemeData(
      primaryColor: Colors.black
    ),
  ));
}