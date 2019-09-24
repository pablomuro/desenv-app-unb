import 'package:flutter/material.dart';
import 'package:meau/style.dart';


class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("INFORMAÇÕES PESSOAIS", style: TextStyle(color: Colors.red),),
          SizedBox(height: 32.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Nome Completo',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Idade',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Estado',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Cidade',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Endereço',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Telefone',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 28.0),
          Text("INFORMAÇÕES DE PERFIL", style: TextStyle(color: Colors.red),),
          SizedBox(height: 32.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Nome de Usuário',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Senha',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 36.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Confirmação de Senha',
              contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
            ),
            validator: userNameValidator,
          ),
          SizedBox(height: 28.0),
          Text("FOTO DE PERFIL", style: TextStyle(color: Colors.red),),
          SizedBox(height: 32.0),
          Center(
            child: Container(
              padding: EdgeInsets.all(48.0),
              decoration: BoxDecoration(
                color: ImagePickerGray,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: new Offset(1.0, 4.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.control_point, color: DefaultTextColor,),
                  Text(
                    'Adicionar Foto',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: DefaultTextColor),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 32.0),
                Container(
                width: 232.0,
                height: 40.0,
                child: RaisedButton(
                    child: Text('FAZER CADASTRO'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    })),
                    SizedBox(height: 24.0),
              ],
            ),
          ),
          
        ]));
  }
}

String userNameValidator(value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
}

