import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/CustomExpansionTile.dart';
import 'package:meau/widgets/AppDrawer/CustomUserAccountsDrawerHeader.dart';
import 'package:meau/widgets/GrayText.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AuthService.dart';
class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _showUserDetails = false;
  bool _isUserLogged = false;

  User user = AuthService.instance.loggedUser;

  @override
  void initState() {
    super.initState();
    _showUserDetails = true;
    _isUserLogged = (user != null);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isUserLogged = (user != null);
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
              child: (user != null) ? Image.memory(user.profileImage) : Text("A", style: TextStyle(fontSize: 40.0)), 
            ),
            accountName: (user != null) ? GrayText(user.name,) : GrayText('Anônimo'),
            onDetailsPressed: () => setState(() {
              _showUserDetails = !_showUserDetails;
            }),
          ),
          _showUserDetails && _isUserLogged
              ? Column(
                  children: [
                    DrawerListItem(
                      text: 'Meu perfil',
                      onTap: () {
                        Navigator.pushNamed(context, Router.profileRoute);
                        // Update the state of the app.
                      },
                    ),
                    DrawerListItem(
                      text: 'Meus pets',
                      onTap: () {
                        Navigator.pushNamed(context, Router.myPets);
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
              : !_showUserDetails && _isUserLogged ? SizedBox(height: 0, width: 0) :
              DrawerListItem(
                text: 'Register',
                onTap: () {
                  Navigator.pushNamed(context, Router.registerRoute);
                  // Update the state of the app.
                },
                hasBorder: false
              ),
          CustomExpansionTile(
            backgroundColor: DefaultLightYellowColor,
            title: CustomExpansionTileTile(icon: Icons.pets, text: 'Atalhos'),
            initiallyExpanded: true,
            children: [
              DrawerListItem(
                text: 'Cadastrar Pet',
                onTap: () {
                  Navigator.pushNamed(context, Router.cadastroAnimal);
                },
              ),
              DrawerListItem(
                text: 'Adotar um pet',
                onTap: () {
                  Navigator.pushNamed(context, Router.adoption);
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
                  Navigator.pushNamed(context, Router.dicasRoute);
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
                  Navigator.pushNamed(context, Router.termosRoute);
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
                    Navigator.pushNamed(context, Router.privacidadeRoute);
                  },
                  hasBorder: false)
            ],
          ),
          DrawerListItem(
              onTap: () => Navigator.pushNamed(context, Router.logoutRoute),
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
              padding: text != 'Sair'
                  ? EdgeInsets.only(left: 48.0)
                  : EdgeInsets.zero,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: hasBorder
                              ? Theme.of(context).dividerColor
                              : Colors.transparent),
                    ),
                  ),
                  padding: text != 'Sair'
                      ? const EdgeInsets.only(top: 16.0, bottom: 20.0)
                      : EdgeInsets.zero,
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
