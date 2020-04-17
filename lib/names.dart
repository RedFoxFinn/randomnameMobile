import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:randomname/name.dart';
import 'dart:math';

var _textSizes = [24.0, 18.0, 28.0];
var _textColors = [Colors.pink, Colors.teal, Colors.white70, Colors.black54];

class Names extends StatefulWidget {
  final List<String> _male;
  final List<String> _female;

  Names.fromJson(Map<String, dynamic> json)
    : this._male = json['male'],
      this._female = json['female'];

  @override
  _Names createState() => new _Names();
}

class _Names extends State<Names> {
  Name _randomizedName;
  String _showList;

  void initState() {
    super.initState();
  }

  Widget _buildListWidgets(List<Widget> names) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => names[index],
      itemCount: names.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final namesMale = <Name>[];
    final namesFemale = <Name>[];

    for (var i = 0; i < widget._male.length; i++) {
      namesMale.add(Name('list', 'male', widget._male[i]));
    }

    for (var i = 0; i < widget._female.length; i++) {
      namesFemale.add(Name('list', 'female', widget._female[i]));
    }

    _maleNames() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(child: _buildListWidgets(namesFemale)),
      );
    }

    _femaleNames() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(child: _buildListWidgets(namesFemale)),
      );
    }

    _randomName(gender) {
      if (gender == 'female') {
        int randomNumber = new Random().nextInt(widget._female.length + 1);
        return widget._female[randomNumber];
      } else {
        int randomNumber = new Random().nextInt(widget._male.length + 1);
        return widget._male[randomNumber];
      }
    }

    _withListFemale() {
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _femaleNames(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: RaisedButton.icon(
                      onPressed: () => setState(() => _randomizedName = null),
                      color: _textColors[2],
                      icon: Icon(Mdi.cancel,
                          color: _textColors[3], size: _textSizes[2]),
                      label: Text(
                        'reset',
                        style: TextStyle(
                            fontSize: _textSizes[0], color: _textColors[3]),
                      )),
                ),
              ],
            )),
      );
    }
    _withListMale() {
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _maleNames(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: RaisedButton.icon(
                      onPressed: () => setState(() => _randomizedName = null),
                      color: _textColors[2],
                      icon: Icon(Mdi.cancel,
                          color: _textColors[3], size: _textSizes[2]),
                      label: Text(
                        'reset',
                        style: TextStyle(
                            fontSize: _textSizes[0], color: _textColors[3]),
                      )),
                ),
              ],
            )),
      );
    }

    _withResult() {
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton.icon(
                          onPressed: () => setState(() => _randomizedName = Name('random', 'female', _randomName('female'))),
                          color: _textColors[0],
                          icon: Icon(Mdi.genderFemale,
                              color: _textColors[2], size: _textSizes[2]),
                          label: Text(
                            'female',
                            style: TextStyle(
                                fontSize: _textSizes[0], color: _textColors[2]),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton.icon(
                          onPressed: () => setState(() => _randomizedName = Name('random', 'male', _randomName('male'))),
                          color: _textColors[1],
                          icon: Icon(Mdi.genderMale,
                              color: _textColors[2], size: _textSizes[2]),
                          label: Text(
                            'male',
                            style: TextStyle(
                                fontSize: _textSizes[0], color: _textColors[2]),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: this._randomizedName,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: RaisedButton.icon(
                      onPressed: () => setState(() => _randomizedName = null),
                      color: _textColors[2],
                      icon: Icon(Mdi.cancel,
                          color: _textColors[3], size: _textSizes[2]),
                      label: Text(
                        'reset',
                        style: TextStyle(
                            fontSize: _textSizes[0], color: _textColors[3]),
                      )),
                ),
              ],
            )),
      );
    }

    _withoutResult() {
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton.icon(
                          onPressed: () => setState(() => _randomizedName = Name('random', 'female', _randomName('female'))),
                          color: _textColors[0],
                          icon: Icon(Mdi.genderFemale,
                              color: _textColors[2], size: _textSizes[2]),
                          label: Text(
                            'female',
                            style: TextStyle(
                                fontSize: _textSizes[0], color: _textColors[2]),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton.icon(
                          onPressed: () => setState(() => _randomizedName = Name('random', 'male', _randomName('male'))),
                          color: _textColors[1],
                          icon: Icon(Mdi.genderMale,
                              color: _textColors[2], size: _textSizes[2]),
                          label: Text(
                            'male',
                            style: TextStyle(
                                fontSize: _textSizes[0], color: _textColors[2]),
                          )),
                    ),
                  ],
                ),
              ],
            )),
      );
    }

    return this._showList == 'female'
      ? _withListFemale()
      : this._showList == 'male'
        ? _withListMale()
        : this._randomizedName == null
          ? _withoutResult()
          : _withResult();
  }
}
