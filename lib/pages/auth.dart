//this screen is the first screen in app
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auth_test_app/constraint.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auth_test_app/pages/login.dart';

// ignore: must_be_immutable
class AuthButtons extends StatelessWidget {
  String signType = 'Sign In';
  AuthButtons({this.signType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ConstraintClass.blueAppColor),
      child: FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Login(
                authType: signType,
              );
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(signType, style: ConstraintClass.buildTextStyle()),
              FaIcon(signType.toLowerCase() == 'sign in'
                  ? FontAwesomeIcons.angleDoubleRight
                  : FontAwesomeIcons.angleDoubleLeft),
            ],
          )),
    );
  }
}

class Luncher extends StatelessWidget {
  Widget _buildTitle(BuildContext context) {
    return Container(
      child: WavyAnimatedTextKit(
        textStyle: ConstraintClass.buildTextStyle(titleStyle: true),
        text: [
          ConstraintClass.titleAuthScreen,
        ],
        isRepeatingAnimation: true,
      ),
      height: ConstraintClass.getSpaceBetweenAuthButtonAndTitle(context),
    );
  }

  static AppBar buildAppBar() {
    return AppBar(
      title: Text(ConstraintClass.appName,
          style: ConstraintClass.buildTextStyle()),
      centerTitle: true,
      backgroundColor: ConstraintClass.secondaryBlueAppColor,
      shadowColor: Colors.blue,
      elevation: 30,
      titleSpacing: 50,
      brightness: Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: ConstraintClass.mainAppColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(context),
            AuthButtons(
              signType: 'Sign In',
            ),
            SizedBox(
              height: ConstraintClass.getSpaceBetweenAuthButtons(context),
            ),
            AuthButtons(
              signType: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
