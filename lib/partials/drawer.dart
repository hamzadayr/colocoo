import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../current_user.dart';
import '../login.dart';
import '../models/tabs.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(87.5),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 3.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/user.jpg'))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'DAYR Amine',
                        style: TextStyle(
                            fontFamily: 'poppins-regular',
                            fontSize: 25.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            title: Text('Accueil'),
            leading: Icon(Icons.card_travel),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(0);
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Demandes'),
            leading: Icon(Icons.folder_open),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(1);
              Navigator.pop(context);
            },
          ),
        
          Divider(),
          ListTile(
            title: Text('Mon compte'),
            leading: Icon(Icons.face),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(2);
              Navigator.pop(context);
            },
          ),

          Divider(),
          ListTile(
            title: Text('Déconnexion'),
            leading: Icon(Icons.lock_open),
            onTap: () {
              Provider.of<CurrentUser>(context).logout();
              Navigator.pop(context);
               Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(),
                    fullscreenDialog: true),
              );
            },
          ),
          Divider()
        ],
      ),
    );
  }
}
