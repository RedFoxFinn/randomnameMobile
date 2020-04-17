
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _textSizes = [24.0, 18.0, 28.0, 42.0];
var _textColors = [Colors.pink, Colors.teal, Colors.white70];

class Name extends StatelessWidget {
  final String _name;
  final String _type;
  final String _gender;

  Name(this._type, this._gender, this._name);

  getGender() {
    return this._gender;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this._name,
        style: TextStyle(
            color: this._gender == 'female' ? _textColors[0] : this._gender == 'male' ? _textColors[1] : _textColors[2],
            fontSize: this._type == 'random' ? _textSizes[3] : _textSizes[1]
        ),
      ),
    );
  }
}