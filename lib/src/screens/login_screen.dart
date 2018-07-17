import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidatorMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton()
            ],
          ),
        ));
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: " Email Address", hintText: "test@email.com"),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Password", hintText: "Password"),
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text("Submit!!!"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("Saved $email and $password ");
        }
      },
    );
  }
}
