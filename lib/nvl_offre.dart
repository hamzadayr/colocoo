import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'models/offre.dart';
import 'db.dart';


class AddOffre extends StatefulWidget {
  @override
  _AddOffreState createState() => _AddOffreState();
}

class _AddOffreState extends State<AddOffre> {
  String dropdownValue_capacite = '1';
  bool terrasse = false;
  bool wifi = false;
  bool laveLinge = false;

  TextEditingController _adressController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _superficieController = TextEditingController();

  File _image;
  final picker = ImagePicker();
   Future getImage() async {
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);

        setState(() {
          _image = image;
            print('Image Path $_image');
        });
      }
  @override
  Widget build(BuildContext context) {

  


    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child:   IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
                        Navigator.of(context).pop();
                      }),
        ),
        title: Text('Nouvel Offre ',style: TextStyle(fontFamily: 'poppins-regular',fontWeight: FontWeight.w500),),
      ),
      body: ListView(
        children: <Widget>[
          AddNvlOffre(),
          
        ],
      ),
    );
  }


    Widget AddNvlOffre() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: new ListView(
        children: <Widget>[
         SizedBox(height: 50,),
         new Row(
           children: <Widget>[
             new Expanded(
               child: new Padding(
                 padding: const EdgeInsets.only(left: 40.0),
                 child: new Text(
                   "L’adresse du logement",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                 ),
               ),
             ),
           ],
         ),
         new Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
           alignment: Alignment.center,
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                   color: Colors.teal,
                   width: 0.5,
                   style: BorderStyle.solid),
             ),
           ),
           padding: const EdgeInsets.only(left: 0.0, right: 10.0),
           child: new Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               new Expanded(
                 child: TextField(
                  controller: _adressController,
                   style: TextStyle(
                       color: Colors.teal
                   ),
                   cursorColor: Colors.teal,
                   textAlign: TextAlign.left,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Adresse du logement ...',
                     hintStyle: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Quicksand'),
                   ),
                   onChanged: (String str){
                     setState(() {
                       //_data.name = str;
                     });
                   },
                 ),
               ),
             ],
           ),
         ),
         Divider(
           height: 24.0,
         ),

         new Row(
           children: <Widget>[
             new Expanded(
               child: new Padding(
                 padding: const EdgeInsets.only(left: 40.0),
                 child: new Text(
                   "Superficie",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                 ),
               ),
             ),
           ],
         ),
         new Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
           alignment: Alignment.center,
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                   color: Colors.teal,
                   width: 0.5,
                   style: BorderStyle.solid),
             ),
           ),
           padding: const EdgeInsets.only(left: 0.0, right: 10.0),
           child: new Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               new Expanded(
                 child: TextField(
                  controller: _superficieController,
                   style: TextStyle(
                       color: Colors.teal
                   ),
                   cursorColor: Colors.teal,
                   textAlign: TextAlign.left,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'La superficie en m2',
                     hintStyle: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Quicksand'),
                   ),
                   onChanged: (String str){
                     setState(() {
                       //_data.name = str;
                     });
                   },
                 ),
               ),
             ],
           ),
         ),
         Divider(
           height: 24.0,
         ),

         new Row(
           children: <Widget>[
             new Expanded(
               child: new Padding(
                 padding: const EdgeInsets.only(left: 40.0),
                 child: new Text(
                   "Prix",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                 ),
               ),
             ),
           ],
         ),
         new Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
           alignment: Alignment.center,
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                   color: Colors.teal,
                   width: 0.5,
                   style: BorderStyle.solid),
             ),
           ),
           padding: const EdgeInsets.only(left: 0.0, right: 10.0),
           child: new Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               new Expanded(
                 child: TextField(
                   controller: _prixController,
                   style: TextStyle(
                       color: Colors.teal
                   ),
                   cursorColor: Colors.teal,
                   textAlign: TextAlign.left,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Le prix de location (DH)',
                     hintStyle: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Quicksand'),
                   ),
                   onChanged: (String str){
                     setState(() {
                       //_data.name = str;
                     });
                   },
                 ),
               ),
             ],
           ),
         ),
         Divider(
           height: 24.0,
         ),

         new Row(
           children: <Widget>[
             new Expanded(
               child: new Padding(
                 padding: const EdgeInsets.only(left: 40.0),
                 child: new Text(
                   "Capacité",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                 ),
               ),
             ),
           ],
         ),
         new Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
           alignment: Alignment.center,
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                   color: Colors.teal,
                   width: 0.5,
                   style: BorderStyle.solid),
             ),
           ),
           padding: const EdgeInsets.only(left: 0.0, right: 10.0),
           child: new Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               new Expanded(
                 child: DropdownButton<String>(
                  value: dropdownValue_capacite,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.teal),
                 
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue_capacite = newValue;
                    });
                  },
                  items: <String>['1', '2', '3', '4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
               ),
             ],
           ),
         ),
         Divider(
           height: 24.0,
         ),

        new Row(
           children: <Widget>[
              Container(
                          padding:EdgeInsets.fromLTRB(5,0,10,0),
                          child: Text('Supplémentaire',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),
                          ),
                        ),
           ],
         ),
         SizedBox(height: 20),
         new Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
           alignment: Alignment.center,
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                   color: Colors.teal,
                   width: 0.5,
                   style: BorderStyle.solid),
             ),
           ),
           padding: const EdgeInsets.only(left: 0.0, right: 10.0),
           child: new Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("La terrasse" ,
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                  ),
                  
                  Checkbox(
                    value: terrasse,
                    onChanged: (bool value) {
                      setState(() {
                        terrasse = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("WIFI",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                  ),
                  Checkbox(
                    value: wifi,
                    onChanged: (bool value) {
                      setState(() {
                        wifi = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Lave-Linge",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.teal,
                       fontSize: 15.0,
                       fontFamily: 'Quicksand'
                   ),
                  ),
                  Checkbox(
                    value: laveLinge,
                    onChanged: (bool value) {
                      setState(() {
                        laveLinge = value;
                      });
                    },
                  ),
                ],
              ),
             ],
           ),
         ),
         Divider(
           height: 24.0,
         ),
         
         


          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.teal,
                    onPressed: () {
                      _addOffre(_adressController.text, _prixController.text,_superficieController.text,dropdownValue_capacite);
                                          },
                                          child: new Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15.0,
                                              horizontal: 20.0,
                                            ),
                                            child: new Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Expanded(
                                                  child: Text(
                                                    "Ajouter",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Quicksand'
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      
                        void  _addOffre(String adresse, String prix, String superficie, String capacite) async{
                            Offre _offre =Offre();
                            try{
                                  _offre.oid = adresse;
                                  _offre.prix = prix;
                                  _offre.superficie = superficie;
                                  _offre.capacite = adresse;      
                                  String _returnString = await ConnexionDatabase().createOffre(_offre);                            
                            }catch(e){

                            }
                        }

}

