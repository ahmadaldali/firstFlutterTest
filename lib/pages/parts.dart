//this screen is the second screen in app (after login user).
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:auth_test_app/constraint.dart';
import 'package:auth_test_app/models/ProviderTest.dart';

//components section
//-----------------------------------------------------------------------------------------//

// ignore: must_be_immutable
class GenderClass extends StatelessWidget {
  String gender = '';
  GenderClass({this.gender});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double iconSize =
        MediaQuery.of(context).orientation == Orientation.portrait
            ? height * 0.1
            : height * 0.08;
    Color menColor = Provider.of<ProviderTest>(context).men;
    Color femaleColor = Provider.of<ProviderTest>(context).femaleColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (gender == 'male') {
              Provider.of<ProviderTest>(context, listen: false)
                  .changeMenColor();
              Provider.of<ProviderTest>(context, listen: false)
                  .changeFemaleColor();
            } else {
              if (gender == 'female') {
                Provider.of<ProviderTest>(context, listen: false)
                    .changeFemaleColor();
                Provider.of<ProviderTest>(context, listen: false)
                    .changeMenColor();
              }
            }
          },
          child: FaIcon(
            gender == 'male' ? FontAwesomeIcons.mars : FontAwesomeIcons.female,
            size: iconSize,
            color: gender == 'male' ? menColor : femaleColor,
          ),
        ),
        SizedBox(height: height * 0.04),
        Text(gender.toUpperCase())
      ],
    );
  }
}

//------------------------------------------------------------------------------------//

// ignore: must_be_immutable
class SliderComponents extends StatefulWidget {
  String title = '';
  SliderComponents({this.title});

  @override
  _SliderComponentsState createState() => _SliderComponentsState();
}

class _SliderComponentsState extends State<SliderComponents> {
  double sliderValue = 160;

  @override
  Widget build(BuildContext context) {
    final double sizeFontContent =
        MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 15;
    final double sizeFontVal =
        MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 30;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title.toUpperCase(),
            style: TextStyle(fontSize: sizeFontContent)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              sliderValue.toInt().toString(),
              style:
                  TextStyle(fontSize: sizeFontVal, fontWeight: FontWeight.w900),
            ),
            Text(
              'cm',
              style: TextStyle(fontSize: sizeFontContent),
            ),
          ],
        ),
        Slider(
            value: sliderValue,
            min: 0,
            max: 300,
            activeColor: Colors.red,
            inactiveColor: Colors.white,
            label: sliderValue.toString(),
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            }),
      ],
    );
  }
}

//--------------------------------------------------------------------------------//

// ignore: must_be_immutable
class WeightAndAge extends StatefulWidget {
  String title;
  WeightAndAge({this.title});

  @override
  _WeightAndAgeState createState() => _WeightAndAgeState();
}

class _WeightAndAgeState extends State<WeightAndAge> {
  double age = 20;
  double weight = 60;

  @override
  Widget build(BuildContext context) {
    final double sizeFontContent =
        MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 15;
    final double sizeFontVal =
        MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 30;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        widget.title.toUpperCase(),
        style: TextStyle(fontSize: sizeFontContent),
      ),
      Text(
        widget.title == 'age'
            ? age.toInt().toString()
            : weight.toInt().toString(),
        style: TextStyle(fontSize: sizeFontVal, fontWeight: FontWeight.w900),
      ),
      Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FloatingActionButton(
              heroTag: widget.title == 'age' ? 'age' : 'weight',
              onPressed: () {
                setState(() {
                  widget.title == 'age' ? age++ : weight++;
                  age > 130 ? age = 130 : age = age;
                  weight > 300 ? weight = 300 : weight = weight;
                });
              },
              child: FaIcon(FontAwesomeIcons.plus)),
          Padding(padding: EdgeInsets.all(5)),
          FloatingActionButton(
            heroTag: widget.title == 'age' ? 'age-' : 'weight-',
            onPressed: () {
              setState(() {
                widget.title == 'age' ? age-- : weight--;
                age <= 0 ? age = 0 : age = age;
                weight <= 0 ? age = 0 : weight = weight;
              });
            },
            child: FaIcon(FontAwesomeIcons.minus),
          )
        ]),
      ),
    ]);
  }
}

//-----------------------------------------------------------//
// ignore: must_be_immutable
class Component extends StatelessWidget {
  double marginValue = 10;
  double borderValue = 10;
  Color co = ConstraintClass.mainAppColor;

  Widget content;
  Component(this.content);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(marginValue),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderValue),
          color: co,
        ),
        child: Container(child: content),
      ),
    );
  }
}
//--------------------------------------------------------------------------------//

//homepage section
// ignore: must_be_immutable
class Parts extends StatelessWidget {
  String nameApp = ConstraintClass.appName;
  Color co = ConstraintClass.mainAppColor;

  Widget _buildFirstRow() {
    return Row(
      children: [
        Component(GenderClass(
          gender: 'male',
        )),
        Component(GenderClass(
          gender: 'female',
        )),
      ],
    );
  }

  Widget _buildSecondRow() {
    return Row(
      children: [
        Component(SliderComponents(
          title: 'height',
        )),
      ],
    );
  }

  Widget _buildThirdRow() {
    return Row(
      children: [
        Component(WeightAndAge(
          title: 'weight',
        )),
        Component(WeightAndAge(
          title: 'age',
        )),
      ],
    );
  }

  Widget _buildPartsBody() {
    return Container(
      child: Column(
        children: [
          Expanded(child: _buildFirstRow()),
          Expanded(child: _buildSecondRow()),
          Expanded(child: _buildThirdRow()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameApp),
        centerTitle: false,
        leading: RaisedButton(
          color: ConstraintClass.mainAppColor,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.exit_to_app),
        ),
      ),
      body: Builder(builder: (context) {
        return _buildPartsBody();
      }),
    );
  }
}
