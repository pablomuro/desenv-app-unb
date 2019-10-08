import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meau/blocs/UserBloc.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/routes.dart';
import 'package:meau/style.dart';


class RegisterForm extends StatefulWidget {

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = BlocProvider.getBloc<UserBloc>();

  @override
  void initState() {
    super.initState();
  }


  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _bloc.setPicture(image);
    _bloc.setImageStream(image);
  }

  register() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      try{
        _bloc.insertOrUpdate();
        Navigator.pushNamed(context, Router.homeRoute); 
      } on Exception catch (error) {
        return _buildErrorDialog(context, error.toString());
      }
    }
  }

  String notNullValidator(value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
  }

  String confirmPassword(value){
    var notNull = notNullValidator(value);
    if(notNull != null) return notNull;

    if(_bloc.confirmPassword()){
      return null;
    }
    return 'Senhas não são iguais';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: _bloc.userStream,
      builder: (context, snapshot) {
        return Form(
            key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("INFORMAÇÕES PESSOAIS", style: TextStyle(color: DefaultGrennColor),),
              SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome Completo',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setName(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Idade',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setAge(int.parse(value)),
                
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setEmail(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Estado',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setState(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Cidade',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setCity(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Endereço',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setAdrress(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Telefone',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setPhone(value)
              ),
              SizedBox(height: 28.0),
              Text("INFORMAÇÕES DE PERFIL", style: TextStyle(color: DefaultGrennColor),),
              SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome de Usuário',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: notNullValidator,
                onChanged: (value) => _bloc.setUsername(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Senha',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: confirmPassword,
                onChanged: (value) => _bloc.setPassword(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirmação de Senha',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                validator: confirmPassword,
                onChanged: (value) => _bloc.setConfirmPassword(value)
              ),
              SizedBox(height: 28.0),
              Text("FOTO DE PERFIL", style: TextStyle(color: DefaultGrennColor),),
              SizedBox(height: 32.0),
              Center(
                child: InkWell(
                  onTap: getImage,
                  child: StreamBuilder<Object>(
                    stream: _bloc.imageStrem,
                    builder: (context, snapshot) {
                      if (snapshot.hasData){
                        return Container(
                          width: 150.0,
                          height: 150.0,
                          child: Image.file(snapshot.data)
                        );
                      }
                      return Container(
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
                      );
                    }
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
                        onPressed: register
                    )),
                    SizedBox(height: 24.0),
                  ],
                ),
              ),
              
            ]));
      }
    );
  }
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

