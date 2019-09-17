import 'package:flutter/material.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/YellownFlatButton.dart';


class CadastroAnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title: Text('Cadastro Animal',
                style: TextStyle(
                    color: DefaultButtonColor, fontSize: AppTitleTextSize)),
            backgroundColor: DefaultGrennColor,
            elevation: 2,
            iconTheme: IconThemeData(color: DefaultButtonColor)),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
           child: Container(
              child: Center(
                child:  Column(
                     children: <Widget>[ 
                       
                        Text("Tenho interesse em cadastrar o animal para:", style: TextIntroStyle),
                        SizedBox(height: 12.0),
                        Row (
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[ 
                               RaisedButton(
                                onPressed: () => null,
                                child: Text('ADOÇÃO'),
                                color : DefaultYellowColor,
                                padding: new EdgeInsets.all(3.0),

                              ),
                              RaisedButton(
                                onPressed: () => null,
                                child: Text('APADRINHAR'),
                                color: DefaultYellowColor,
                                padding: new EdgeInsets.all(3.0),


                              ),
                              RaisedButton(
                                onPressed: () => null,
                                child: Text('AJUDA'),
                                color : DefaultYellowColor,
                                padding: new EdgeInsets.all(3.0),

                              )
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row( 
                          children: <Widget>[
                              Text('Adoção',
                                style: TextStyle(
                                color: DefaultButtonColor, 
                                fontSize: AppTitleTextSize
                            ))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                              Flexible( child:
                                TextFormField(
                                decoration: InputDecoration(   
                                  labelText: 'Nome do animal')
                              )
                            )
                              
                            ],
                        ),
                       
                        SizedBox(height: 28.0),
                        Row( 
                          children: <Widget>[
                              Text('ESPÉCIE',
                                style: TextIntroStyle)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Radio(
                                  value: 0,
                                ),
                                Text('Cachorro'),
                                Radio(
                                  value: 1,
                                ),
                                Text('Gato')
                            ],
                        ),
                        SizedBox(height: 18.0),
                        Row( 
                          children: <Widget>[
                              Text('SEXO',
                                style: TextIntroStyle)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Radio(
                                  value: 0,
                                ),
                                Text('Macho'),
                                Radio(
                                  value: 1,
                                ),
                                Text('Fêmea')
                            ],
                        ),
                        SizedBox(height: 18.0),
                        Row( 
                          children: <Widget>[
                              Text('PORTE',
                                style: TextIntroStyle)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Radio(
                                  value: 0,
                                ),
                                Text('Pequeno'),
                                Radio(
                                  value: 1,
                                ),
                                Text('Médio'),
                                Radio(
                                  value: 2,
                                ),
                                Text('Grande')
                            ],
                        ),
                        SizedBox(height: 18.0),
                        Row( 
                          children: <Widget>[
                              Text('IDADE',
                                style: TextIntroStyle)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Radio(
                                  value: 0,
                                ),
                                Text('Filhote'),
                                Radio(
                                  value: 1,
                                ),
                                Text('Adulto'),
                                Radio(
                                  value: 2,
                                ),
                                Text('Idoso')
                            ],
                        ),
                        SizedBox(height: 18.0),
                        Row( 
                          children: <Widget>[
                              Text('TEMPERAMENTO',
                                style: TextIntroStyle)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                 Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Brincalhão"),
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Timido"),
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Calmo")
                            ],
                         ),
                        SizedBox(height: 8.0),
                         Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                 Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Guarda"),
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Amoroso"),
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Preguiçoso")
                            ],
                         ),
                        SizedBox(height: 18.0),
                        Row( 
                          children: <Widget>[
                              Text('SAÚDE',
                                style: TextIntroStyle)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                 Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Vacinado "),
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Vermifugado"),
                            ],
                         ),
                        SizedBox(height: 8.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                 Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Castrado"),
                                  Checkbox(
                                    value: false,
                                    onChanged: (bool newValue) {
                                    },
                                  ),
                                  Text("Doente"),
                            ],
                         ),
                         SizedBox(height: 8.0),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Flexible( child:
                                TextFormField(
                                decoration: InputDecoration(   
                                  labelText: 'Doenças do animal')
                              )
                            )
                              
                            ],
                        ),
                        SizedBox(height: 36.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              YellownFlatButton(
                                onPressed: () => null,
                                text: 'COLOCAR PARA ADOÇÃO',
                              ),
                          ],
                        ),
                        SizedBox(height: 36.0)
                      ],
                ),
          ),
        ),
        )
      );
  }
}