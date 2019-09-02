import 'package:flutter/material.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/CustomExpansionTile.dart';
import 'package:meau/widgets/AppDrawer/CustomUserAccountsDrawerHeader.dart';
import 'package:meau/widgets/GrayText.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _showUserDetails = false;

  @override
  void initState() {
    super.initState();
    _showUserDetails = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          CustomUserAccountsDrawerHeader(
            accountEmail: null,
            decoration: BoxDecoration(color: DefaultGrennColor),
            currentAccountPicture: CircleAvatar(
              child: Text("A", style: TextStyle(fontSize: 40.0)),
            ),
            accountName: GrayText('Dev App user'),
            onDetailsPressed: () => setState(() {
              _showUserDetails = !_showUserDetails;
            }),
          ),
          _showUserDetails
              ? Column(
                  children: [
                    DrawerListItem(
                      text: 'Meu perfil',
                      onTap: () {
                        // Update the state of the app.
                      },
                    ),
                    DrawerListItem(
                      text: 'Meus pets',
                      onTap: () {
                        // Update the state of the app.
                      },
                    ),
                    DrawerListItem(
                      text: 'Favoritos',
                      onTap: () {
                        // Update the state of the app.
                      },
                    ),
                    DrawerListItem(
                      text: 'Chat',
                      onTap: () {
                        // Update the state of the app.
                      },
                    ),
                  ],
                )
              : SizedBox(height: 0, width: 0),
          Container(
            child: ExpansionTile(
              backgroundColor: DefaultLightYellowColor,
              title: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.pets,
                      color: DefaultTextColor,
                    ),
                    GrayText('Atalhos')
                  ],
                ),
              ),
              initiallyExpanded: true,
              children: [
                DrawerListItem(
                  text: 'Cadastrar Pet',
                  onTap: () {
                    // Update the state of the app.
                  },
                ),
                DrawerListItem(
                  text: 'Adotar um pet',
                  onTap: () {
                    // Update the state of the app.
                  },
                ),
                DrawerListItem(
                  text: 'Ajudar um pet',
                  onTap: () {
                    // Update the state of the app.
                  },
                ),
                DrawerListItem(
                  text: 'Apadrinhar um pet',
                  onTap: () {
                    // Update the state of the app.
                  },
                ),
              ],
            ),
          ),
          CustomExpansionTile(
            title: Container(
              child: Row(
                children: [Icon(Icons.settings), GrayText('a')],
              ),
            ),
            initiallyExpanded: true,
            children: [
              DrawerListItem(
                text: 'Dicas',
                onTap: () {
                  // Update the state of the app.
                },
              ),
              DrawerListItem(
                text: 'Eventos',
                onTap: () {
                  // Update the state of the app.
                },
              ),
              DrawerListItem(
                text: 'Legislação',
                onTap: () {
                  // Update the state of the app.
                },
              ),
              DrawerListItem(
                text: 'Termos de adoção',
                onTap: () {
                  // Update the state of the app.
                },
              ),
              DrawerListItem(
                text: 'Histórias de adoção',
                onTap: () {
                  // Update the state of the app.
                },
              ),
            ],
          ),
          CustomExpansionTile(
            title: GrayText('Configurações'),
            initiallyExpanded: true,
            children: [
              DrawerListItem(
                text: 'Privacidade',
                onTap: () {
                  // Update the state of the app.
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  DrawerListItem({Key key, @required this.onTap, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: GrayText(text),
        onTap: () {
          onTap();
          Navigator.pop(context);
        },
      ),
    );
  }
}
