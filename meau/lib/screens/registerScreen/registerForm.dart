import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meau/blocs/UserBloc.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/widgets/errorDialog.dart';
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
    _bloc.setPicture(image.readAsBytesSync());
    _bloc.setImageStream(image.readAsBytesSync());
  }

  register() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save(); 
      try{
        bool retorno = await _bloc.insertOrUpdate();
        if(retorno){
          Navigator.pushNamed(context, Router.homeRoute); 
        }
      } on Exception catch (e) {
        dynamic error = e;
        return ErrorDialog.buildErrorDialog(context, error.message.message);
      }
    }
  }

  String notNullValidator(value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
  }

  String validatePassword(value){
    var notNull = notNullValidator(value);
    if(notNull != null) return notNull;

    return _bloc.validatePassword();
  }

  String emailValidator(value){
    var notNull = notNullValidator(value);
    if(notNull != null) return notNull;

    if(EmailValidator.validate(value)){
      return null;
    }

    return 'Email inválido';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: _bloc.userStream,
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Container();
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
                onChanged: (value) => _bloc.setName(value),
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
                validator: emailValidator,
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
                obscureText: true,
                validator: validatePassword,
                onChanged: (value) => _bloc.setPassword(value)
              ),
              SizedBox(height: 36.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirmação de Senha',
                  contentPadding: EdgeInsets.only(left: 12.0, bottom: 8.0)
                ),
                obscureText: true,
                validator: validatePassword,
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
                          child: Image.memory(snapshot.data)
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

