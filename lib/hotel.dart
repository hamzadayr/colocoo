import 'package:flutter/material.dart';
import 'dart:convert';
Color textColor = Colors.black54;
Color textSecondry = Colors.grey;

class SingleHotel extends StatefulWidget {

  @override
  _SingleHotelState createState() => _SingleHotelState();
}

class _SingleHotelState extends State<SingleHotel> {
  var hotel;
  var token;

  @override
  void initState() {
    print(hotel);
    super.initState();
  }



  Widget buildicons(index) {
    List<Widget> widgets = List<Widget>();
    for (int i=0;i<int.tryParse(index);i++){
      widgets.add (Icon(Icons.star,color: Colors.orange[100],size: 15,));
    }
    return Row(children: widgets);
  }
  bool ames;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
        child: FlatButton(
          color: Colors.teal,
          onPressed: (){

          },
          textColor: Colors.white,
          child: Text('BOOK',style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
      body: ListView(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/app1.jpg'),
                      IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
                        Navigator.of(context).pop();
                      }),
                     
                    ],
                  ),
                ),
            Container(
            padding: EdgeInsets.all(3),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.fromLTRB(10,10,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Appartement avec 4 champres ', style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          color: textColor
                        ),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10,0,0,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('ANAS ZNITI', style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: textColor,
                            fontSize: 14
                        ),),

                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: Text(
                                    'Prix',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: textColor,
                                        fontFamily: 'Quicksand'
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Text(
                                  ' 1200 DH',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: textColor,
                                      fontFamily: 'Quicksand'
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: Text(
                                    'Evaluation',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: textColor,
                                        fontFamily: 'Quicksand'
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                buildicons('5'),
                              ],
                            ),
                          ),

                 
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            ),

            
            ],
            ),


      );
  }

  
}

