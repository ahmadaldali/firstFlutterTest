import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth_test_app/constraint.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  String authType;
  Login({this.authType});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _auth;
  String _email;
  String _pass;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _auth = FirebaseAuth.instance;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {});
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  OutlineInputBorder createBoarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget buildEmailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: ConstraintClass.buildTextStyle(inptStyle: true),
      cursorColor: ConstraintClass.formTextInputColor,
      decoration: InputDecoration(
        hintText: ConstraintClass.emailHint,
        hintStyle: ConstraintClass.buildTextStyle(inptStyle: true),
        border: createBoarder(),
        filled: true,
        fillColor: ConstraintClass.secondaryBlueAppColor.withOpacity(0.9),
      ),
      onChanged: (String email) {
        _email = email;
      },
      validator: (String value) {},
    );
  }

  Widget buildPassInput() {
    return TextFormField(
      obscureText: true,
      style: ConstraintClass.buildTextStyle(inptStyle: true),
      cursorColor: ConstraintClass.formTextInputColor,
      decoration: InputDecoration(
        hintText: ConstraintClass.passHint,
        hintStyle: ConstraintClass.buildTextStyle(inptStyle: true),
        border: createBoarder(),
        filled: true,
        fillColor: ConstraintClass.secondaryBlueAppColor.withOpacity(0.9),
      ),
      onChanged: (String pass) {
        _pass = pass;
      },
      validator: (String value) {},
    );
  }

  Widget buildWelcomeMsg() {
    return Column(
      children: [
        Text(
          'Welcome!',
          style: ConstraintClass.buildInputLabelStyle(),
        ),
        Text(
          widget.authType + ' to continue',
          style: ConstraintClass.buildInputLabelStyle(),
        )
      ],
    );
  }

  Widget buildBoxBetweenLabelAndTextInput() {
    return SizedBox(
      height: ConstraintClass.getSpaceLabelAndTextInput(context) * 5,
    );
  }

  Widget buildSubmitButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ConstraintClass.secondaryBlueAppColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () async {
              final newUser = await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _pass);
              if (newUser != null) {
                print(newUser);
              }
            },
            child: Text(
              widget.authType.toUpperCase(),
              style: ConstraintClass.buildTextStyle(inptStyle: true),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFormContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildWelcomeMsg(),
        buildBoxBetweenLabelAndTextInput(),
        buildEmailInput(),
        SizedBox(
          height: ConstraintClass.getSpaceBetweenAuthButtons(context),
        ),
        //buildLabel(ConstraintClass.passLabel),
        /*SizedBox(
          height: ConstraintClass.getSpaceLabelAndTextInput(context),
        ),*/
        buildPassInput(),
        buildBoxBetweenLabelAndTextInput(),
        buildSubmitButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstraintClass.secondaryBlueAppColor,
        //appBar: Luncher.buildAppBar(),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ConstraintClass.mainAppColor,
          ),
          margin: EdgeInsets.all(ConstraintClass.getMarignOfLoginForm(context)),
          padding:
              EdgeInsets.all(ConstraintClass.getMarignOfLoginForm(context)),
          child: Form(
            key: _formKey,
            child: buildFormContent(),
          ),
        ),
      ),
    );
  }
}