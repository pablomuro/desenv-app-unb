import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meau/blocs/AnimalBloc.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/routes.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/YellownFlatButton.dart';
import 'package:meau/widgets/errorDialog.dart';


class CadastroAnimalForm extends StatefulWidget {

  @override
  CadastroAnimalFormState createState() {
    return CadastroAnimalFormState();
  }
}

class CadastroAnimalFormState extends State<CadastroAnimalForm> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = BlocProvider.getBloc<AnimalBloc>();

  var adotarButton = false;

  @override
  void initState() {
    super.initState();
    _bloc.setAnimal(new Animal());
    _bloc.setImageStream(null);
  }

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _bloc.setAnimalImage(image.readAsBytesSync());
    _bloc.setImageStream(image.readAsBytesSync());
  }

  register() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      try{
        bool result = await _bloc.insertOrUpdate();
        if(result){
          Navigator.pushNamed(context, Router.cadastroAnimalSucess); 
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Animal>(
      stream: _bloc.animalStream,
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Container();
        return Form(
            key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Tenho interesse em cadastrar o animal para:", style: TextIntroStyle),
              SizedBox(height: 12.0),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  RaisedButton(
                    onPressed: (){
                      _bloc.setHelpAs(HelpAs.Adoption);
                      _bloc.setAnimal(snapshot.data);
                      setState(() {
                        adotarButton = !adotarButton;
                      });
                    },
                    child: Text('ADOÇÃO'),
                    color : (adotarButton)? DefaultYellowColor :Colors.grey,
                  ),
                  RaisedButton(
                    onPressed: (){
                      _bloc.setHelpAs(HelpAs.Sponsor);
                      _bloc.setAnimal(snapshot.data);
                    },
                    child: Text('APADRINHAR'),
                    color : Colors.grey,
                  ),
                  RaisedButton(
                    onPressed: (){
                      _bloc.setHelpAs(HelpAs.Help);
                      _bloc.setAnimal(snapshot.data);
                    },
                    child: Text('AJUDA'),
                    color : Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 12.0),
              Row( 
                children: [
                    Text('Adoção',
                      style: TextStyle(
                      color: DefaultButtonColor, 
                      fontSize: AppTitleTextSize
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Flexible( child:
                      TextFormField(
                      decoration: InputDecoration(labelText: 'Nome do animal'),
                      onChanged: (value){
                        _bloc.setName(value);
                        _bloc.setAnimal(snapshot.data);
                      },
                    )
                  )
                    
                  ],
              ),
              SizedBox(height: 28.0),
              Text("FOTO DO ANIMAL", style: TextStyle(color: DefaultStrongreYellowColor)),
              SizedBox(height: 32.0),
              Container(
                child: Center(
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
                          constraints: BoxConstraints(minWidth: 999.0, minHeight: 150.0),
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
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Text('ESPÉCIE',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Radio(
                      value: AnimalType.Dog,
                      onChanged: (value){
                        _bloc.setType(value);
                        _bloc.setAnimal(snapshot.data);
                      },
                      groupValue: snapshot.data.type
                    ),
                    Text('Cachorro'),
                    Radio(
                      value: AnimalType.Cat,
                      onChanged: (value){
                        _bloc.setType(value);
                        _bloc.setAnimal(snapshot.data);
                      },
                      groupValue: snapshot.data.type
                    ),
                    Text('Gato')
                ],
              ),
              SizedBox(height: 18.0),
              Row( 
                children: [
                    Text('SEXO',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Radio(
                        value: AnimalSex.Male,
                        onChanged: (value){
                          _bloc.setSex(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.sex
                      ),
                      Text('Macho'),
                      Radio(
                        value: AnimalSex.Female,
                        onChanged: (value){
                          _bloc.setSex(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.sex,
                      ),
                      Text('Fêmea')
                  ],
              ),
              SizedBox(height: 18.0),
              Row( 
                children: [
                    Text('PORTE',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Radio(
                        value: AnimalSize.Small,
                        onChanged: (value){
                          _bloc.setSize(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.size
                      ),
                      Text('Pequeno'),
                      Radio(
                        value: AnimalSize.Medium,
                        onChanged: (value){
                          _bloc.setSize(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.size
                      ),
                      Text('Médio'),
                      Radio(
                        value: AnimalSize.Large,
                        onChanged: (value){
                          _bloc.setSize(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.size
                      ),
                      Text('Grande')
                  ],
              ),
              SizedBox(height: 18.0),
              Row( 
                children: [
                    Text('IDADE',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Radio(
                        value: AnimalAge.Puppy,
                        onChanged: (value){
                          _bloc.setAge(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.age
                      ),
                      Text('Filhote'),
                      Radio(
                        value: AnimalAge.Adult,
                        onChanged: (value){
                          _bloc.setAge(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.age
                      ),
                      Text('Adulto'),
                      Radio(
                        value: AnimalAge.Elderly,
                        onChanged: (value){
                          _bloc.setAge(value);
                          _bloc.setAnimal(snapshot.data);
                        },
                        groupValue: snapshot.data.age
                      ),
                      Text('Idoso')
                  ],
              ),
              SizedBox(height: 18.0),
              Row( 
                children: [
                    Text('TEMPERAMENTO',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasTemper(AnimalPropertiesLists.temper[0]),
                      onChanged: (value) {
                        String temper = AnimalPropertiesLists.temper[0];
                        (value) ? _bloc.addTemper(temper) : _bloc.removeTemper(temper);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Brincalhão"),
                    Checkbox(
                      value: _bloc.hasTemper(AnimalPropertiesLists.temper[1]),
                      onChanged: (value) {
                        String temper = AnimalPropertiesLists.temper[1];
                        (value) ? _bloc.addTemper(temper) : _bloc.removeTemper(temper);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Timido"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasTemper(AnimalPropertiesLists.temper[2]),
                      onChanged: (value) {
                        String temper = AnimalPropertiesLists.temper[2];
                        (value) ? _bloc.addTemper(temper) : _bloc.removeTemper(temper);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Calmo"),
                    Checkbox(
                      value: _bloc.hasTemper(AnimalPropertiesLists.temper[3]),
                      onChanged: (value) {
                        String temper = AnimalPropertiesLists.temper[3];
                        (value) ? _bloc.addTemper(temper) : _bloc.removeTemper(temper);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Guarda"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasTemper(AnimalPropertiesLists.temper[4]),
                      onChanged: (value) {
                        String temper = AnimalPropertiesLists.temper[4];
                        (value) ? _bloc.addTemper(temper) : _bloc.removeTemper(temper);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Amoroso"),
                    Checkbox(
                      value: _bloc.hasTemper(AnimalPropertiesLists.temper[5]),
                      onChanged: (value) {
                        String temper = AnimalPropertiesLists.temper[5];
                        (value) ? _bloc.addTemper(temper) : _bloc.removeTemper(temper);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Preguiçoso")
                  ],
              ),
              SizedBox(height: 18.0),
              Row( 
                children: [
                    Text('SAÚDE',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasHealth(AnimalPropertiesLists.health[0]),
                      onChanged: (value) {
                        String health = AnimalPropertiesLists.health[0];
                        (value) ? _bloc.addHealth(health) : _bloc.removeHealth(health);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Vacinado"),
                    Checkbox(
                      value: _bloc.hasHealth(AnimalPropertiesLists.health[1]),
                      onChanged: (value) {
                        String health = AnimalPropertiesLists.health[1];
                        (value) ? _bloc.addHealth(health) : _bloc.removeHealth(health);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Vermifugado"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasHealth(AnimalPropertiesLists.health[2]),
                      onChanged: (value) {
                        String health = AnimalPropertiesLists.health[2];
                        (value) ? _bloc.addHealth(health) : _bloc.removeHealth(health);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Castrado"),
                    Checkbox(
                      value: _bloc.hasHealth(AnimalPropertiesLists.health[3]),
                      onChanged: (value) {
                        String health = AnimalPropertiesLists.health[3];
                        (value) ? _bloc.addHealth(health) : _bloc.removeHealth(health);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Doente"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Flexible( child:
                      TextFormField(
                      decoration: InputDecoration(labelText: 'Doenças do animal'),
                      onSaved: (value){ if(value != null) _bloc.addHealth(value); },
                    )
                  )
                    
                  ],
              ),
              SizedBox(height: 12.0),
              Row( 
                children: [
                    Text('EXIGÊNCIAS PARA ADOÇÃO',
                      style: TextStyle( 
                      color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasNeeds(AnimalPropertiesLists.needs[0]),
                      onChanged: (value) {
                        String need = AnimalPropertiesLists.needs[0];
                        (value) ? _bloc.addNeeds(need) : _bloc.removeNeeds(need);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Termo de adoção"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasNeeds(AnimalPropertiesLists.needs[1]),
                      onChanged: (value) {
                        String need = AnimalPropertiesLists.needs[1];
                        (value) ? _bloc.addNeeds(need) : _bloc.removeNeeds(need);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Fotos da casa"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasNeeds(AnimalPropertiesLists.needs[2]),
                      onChanged: (value) {
                        String need = AnimalPropertiesLists.needs[2];
                        (value) ? _bloc.addNeeds(need) : _bloc.removeNeeds(need);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Visita prévia ao animal"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _bloc.hasNeeds(AnimalPropertiesLists.needs[3]),
                      onChanged: (value) {
                        String need = AnimalPropertiesLists.needs[3];
                        (value) ? _bloc.addNeeds(need) : _bloc.removeNeeds(need);
                        _bloc.setAnimal(snapshot.data);
                      },
                    ),
                    Text("Acompanhamento pós adoção"),
                  ],
              ),
              SizedBox(height: 8.0),
              Row( 
                children: [
                    Text('SOBRE O ANIMAL',
                      style: TextStyle( 
                        color : DefaultStrongreYellowColor
                      )
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Flexible( child:
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Compartilhe sua história sobre o animal'),
                        onChanged: (value){ _bloc.setAbout(value); },
                      )
                  )
                    
                  ],
              ),
            
              SizedBox(height: 36.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    YellownFlatButton(
                      onPressed: register,
                      text: 'COLOCAR PARA ADOÇÃO',
                    ),
                ],
              ),
              SizedBox(height: 36.0),
            ]));
      }
    );
  }
}

