import 'package:flutter/material.dart';

class ConstraintClass {
  //colors section
  static final Color mainAppColor = Color(0xFF1D1E33);
  static final Color blueAppColor = Colors.blue[300];
  static final Color secondaryBlueAppColor = Colors.lightBlue[100];
  static final Color formTextInputColor = Colors.black;

//string section
  static final String appName = 'My Application Test';
  static final String titleAuthScreen = 'Welcome To My App';
  static final String passLabel = 'Enter Your Password:';
  static final String emailLabel = 'Enter Your Email:';
  static final String emailHint = 'Enter Your Email ...';
  static final String passHint = 'Enter Your Password ...';
  static final String errorMsg = 'Something error!';

  static double getSpaceBetweenAuthButtons(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  static double getSpaceBetweenAuthButtonAndTitle(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.15;
  }

  static double getMarignOfLoginForm(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.04;
  }

  static double getSpaceLabelAndTextInput(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }

  static String getWelcomeMsg(String type) {
    return 'Welcome! \n $type to continue';
  }

  static TextStyle buildTextStyle(
      {bool titleStyle = false, bool inptStyle = false}) {
    double size = titleStyle ? 35 : 25;
    size = inptStyle ? 18 : size;

    Color co = titleStyle ? Colors.white : Colors.black;
    co = inptStyle ? Colors.black : co;

    return TextStyle(
        color: co,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: 'SansitaSwashed');
  }

  static TextStyle buildInputLabelStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: 'SansitaSwashed');
  }
}
