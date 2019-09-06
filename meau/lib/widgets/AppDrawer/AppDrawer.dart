import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
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
        children: [
          CustomUserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
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
                      hasBorder: false,
                    ),
                  ],
                )
              : SizedBox(height: 0, width: 0),
          CustomExpansionTile(
            backgroundColor: DefaultLightYellowColor,
            title: CustomExpansionTileTile(icon: Icons.pets, text: 'Atalhos'),
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
                  hasBorder: false),
            ],
          ),
          CustomExpansionTile(
            backgroundColor: MenuInfoBgColor,
            title:
                CustomExpansionTileTile(icon: Icons.info, text: 'Informações'),
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
                  Navigator.pushNamed(context, Router.legalRoute);
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
                  hasBorder: false),
            ],
          ),
          CustomExpansionTile(
            backgroundColor: MenuConfigBgColor,
            title: CustomExpansionTileTile(
                icon: Icons.settings, text: 'Configurações'),
            initiallyExpanded: true,
            children: [
              DrawerListItem(
                  text: 'Privacidade',
                  onTap: () {
                    // Update the state of the app.
                  },
                  hasBorder: false)
            ],
          ),
          DrawerListItem(
              onTap: () => {},
              text: 'Sair',
              color: DefaultGrennColor,
              textAlign: TextAlign.center,
              hasBorder: false)
        ],
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final Color color;
  final TextAlign textAlign;
  final bool hasBorder;

  DrawerListItem(
      {Key key,
      @required this.onTap,
      @required this.text,
      this.color = MenuTileBgColor,
      this.textAlign,
      this.hasBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: text != 'Sair' ? EdgeInsets.only(left: 48.0): EdgeInsets.zero,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: hasBorder
                              ? Theme.of(context).dividerColor
                              : Colors.transparent),
                    ),
                  ),
                  padding: text != 'Sair' ? const EdgeInsets.only(top: 16.0, bottom: 20.0) : EdgeInsets.zero,
                  child: GrayText(text, textAlign: textAlign)),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            onTap();
          }),
    );
  }
}

class CustomExpansionTileTile extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomExpansionTileTile({Key key, @required this.icon, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 12.0, top: 16.0, left: 16.0),
            child: Icon(icon, color: DefaultTextColor),
          ),
          Container(
              padding: const EdgeInsets.only(left: 32.0), child: GrayText(text))
        ],
      ),
    );
  }
}
