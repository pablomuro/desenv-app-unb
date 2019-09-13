import 'package:flutter/material.dart';
import 'package:meau/routes.dart';


class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

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
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Senha',
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 52.0),
          Container(
              width: 232.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text('ENTRAR'),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.registerRoute);
                    if (_formKey.currentState.validate()) {
                      // Navigator.pushNamed(context, Router.registerRoute);
                    }
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

