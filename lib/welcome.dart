import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'current_user.dart';
import 'login.dart';
import 'offres/home.dart';
import 'profile.dart';
import 'demandes/list_demandes.dart';
import 'partials/drawer.dart';
import 'package:provider/provider.dart';
import 'models/tabs.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _width;
  double _height;
  Widget screen(){
    if(Provider.of<Tabs>(context).currentIndex == 0) {
      return Home();
    }
    else if(Provider.of<Tabs>(context).currentIndex== 1) {
      return Listdemandes();
    }
    else if(Provider.of<Tabs>(context).currentIndex == 2) {
      return ProfilePage();
    }
    else if(Provider.of<Tabs>(context).currentIndex == 3) {
      //return  LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.teal,
        //or set color with: Color(0xFF0000FF)
    statusBarBrightness: Brightness.light));
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: screen(),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: Provider.of<Tabs>(context).currentIndex,
        onItemSelected: (index) => setState(() {
          Provider.of<Tabs>(context).changeIndex(index);
        }),
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Acceuil'),
              activeColor: Colors.teal,
              inactiveColor: Colors.black54
          ),

          BottomNavyBarItem(
              icon: Icon(Icons.hotel),
              title: Text('Demandes'),
              activeColor: Colors.teal,
              inactiveColor: Colors.black54
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.face),
              title: Text('Mon Compte'),
              activeColor: Colors.teal,
              inactiveColor: Colors.black54
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.lock_open),
              title: Text('Déconnexion'),
              activeColor: Colors.teal,
              inactiveColor: Colors.black54
          ),
        ],
      ),
    );
  }

}
