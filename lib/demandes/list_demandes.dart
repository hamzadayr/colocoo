import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tabs.dart';
import 'package:provider/provider.dart';
import '../services/db.dart';
import '../demandes/demande_form.dart';
import '../models/demande.dart';
class Listdemandes extends StatefulWidget {
  @override
  _ListdemandesState createState() => new _ListdemandesState();
}
class _ListdemandesState extends State<Listdemandes> {
  List<Demande> items;
  ConnexionDatabase fireServ = new ConnexionDatabase();
  StreamSubscription<QuerySnapshot> Demandes;
  @override
  void initState() {
    super.initState();
    items = new List();
    Demandes?.cancel();
    Demandes = fireServ.getDemandeList().listen((QuerySnapshot snapshot) {
      final List<Demande> demandes = snapshot.documents
          .map((documentSnapshot) => Demande.fromMap(documentSnapshot.data))
          .toList();
      setState(() {
        this.items = demandes;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(child: Icon(Icons.arrow_back),onTap: (){
              Provider.of<Tabs>(context).changeIndex(0);
            },),
            title: Text('Nouvelle demande',style: TextStyle(fontFamily: 'poppins-regular',fontWeight: FontWeight.w500),),
          ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 530,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(children: <Widget>[
                    // The containers in the background
                    Column(children: <Widget>[
                                      
                                       Padding(
                                            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                            child: Container(

                                            height: 120.0,
                                            width: double.infinity,
                                            //color: Colors.white,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                color: Colors.white
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[


                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                            child:Image.asset('assets/images/demande.jpg',
                                                                                  fit: BoxFit.cover,
                                                                                  width: 160,
                                                           ),
                                              ),

                                              SizedBox(width: 4.0),

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  SizedBox(height: 10,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        '${items[index].demandetype}' ,
                                                        style: TextStyle(
                                                            fontFamily: 'Quicksand',
                                                            fontSize: 17.0,
                                                            color: Colors.black87,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(height: 5.0),
                                                      Container(
                                                        width: 175.0,
                                                        child: Text(
                                                          '${items[index].demandedetails}',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontFamily: 'Quicksand',
                                                              color: Colors.grey,
                                                              fontSize: 15.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                               
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 40.0,
                                                        width: 70.0,
                                                        child: Center(
                                                          child: Text(
                                                            '${items[index].demandebudget}',
                                                            style: TextStyle(
                                                                color: Colors.black87,
                                                                fontFamily: 'Quicksand',
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 35.0),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                
                    ),
                  ]);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: 
        Icon(
          Icons.add,
          size:40,

        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DemandeForm(Demande( '', '', '')),
                fullscreenDialog: true),
          );
        },
      ),
    );
  }
}