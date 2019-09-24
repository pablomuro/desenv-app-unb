import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class LoginForm extends StatefulWidget {

  final AuthService auth= new AuthService();

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  login() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      try {
        FirebaseUser result = await widget.auth.loginUser(email: _email, password: _password);
        print(result);
        Navigator.pushNamed(context, Router.registerRoute);  
      } on AuthException catch (error) {
        return _buildErrorDialog(context, error.message);
      } on Exception catch (error) {
        return _buildErrorDialog(context, error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Nome de usuário',
            ),
            validator: userNameValidator,
            onSaved: (value) => _email = value
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Senha',
            ),
            validator: userNameValidator,
            onSaved: (value) => _password = value
          ),
          SizedBox(height: 52.0),
          Container(
              width: 232.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text('ENTRAR'),
                  onPressed: () {
                    login();
                  })),
        ]));
  }
}

String userNameValidator(value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
}



Future _buildErrorDialog(BuildContext context, _message) {
  return showDialog(
    builder: (context) {
      return AlertDialog(
        title: Text('Error Message'),
        content: Text(_message),
        actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
    context: context,
  );
}
