import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/widgets/errorDialog.dart';

class LoginForm extends StatefulWidget {

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  final AuthService _auth = AuthService.instance;

  login() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      try {
        FirebaseUser _authUser = await _auth.loginUser(email: _email, password: _password);
        if(_authUser?.uid != null){
          Navigator.pushNamed(context, Router.homeRoute);
        }
      } on Exception catch (e) {
        dynamic error = e;
        return ErrorDialog.buildErrorDialog(context, error.message);
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
            validator: notNullValidator,
            onSaved: (value) => _email = value
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Senha',
            ),
            validator: notNullValidator,
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

String notNullValidator(value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
}
