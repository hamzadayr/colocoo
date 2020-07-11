import 'package:flutter/material.dart';
import '../models/tabs.dart';
import 'package:provider/provider.dart';
import '../models/demande.dart';
import '../services/db.dart';
class DemandeForm extends StatefulWidget {
  final Demande demande;
  DemandeForm(this.demande);
  @override
  _DemandeFormState createState() => _DemandeFormState();
}
class _DemandeFormState extends State<DemandeForm> {
  ConnexionDatabase fireServ = new ConnexionDatabase();
  TextEditingController _demandebudgetController;
  TextEditingController _demandedetailsController;
  int _mydemandetype = 0;
  String demandeVal;
  void _handledemandetype(int value) {
    setState(() {
      _mydemandetype = value;
      switch (_mydemandetype) {
        case 1:
          demandeVal = 'appartement';
          break;
        case 2:
          demandeVal = 'maison';
          break;
        case 3:
          demandeVal = 'garsoniere';
          break;
        case 4:
          demandeVal = 'chambre';
          break;
        case 5:
          demandeVal = 'autres';
          break;
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _demandebudgetController =
        new TextEditingController(text: widget.demande.demandebudget);
    _demandedetailsController =
        new TextEditingController(text: widget.demande.demandedetails);
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
            height: 330,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _demandebudgetController,
                    decoration: InputDecoration(labelText: "Budget: "),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _demandedetailsController,
                    decoration: InputDecoration(labelText: "Desciption : "),
                  ),
                ),

                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: Text(
                    'Select Demande Type:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _mydemandetype,
                          onChanged: _handledemandetype,
                          activeColor: Color(0xff4158ba),
                        ),
                        Text(
                          'Villa',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: _mydemandetype,
                          onChanged: _handledemandetype,
                          activeColor: Color(0xfffb537f),
                        ),
                        Text(
                          'Maison',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                 ],
                ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 3,
                          groupValue: _mydemandetype,
                          onChanged: _handledemandetype,
                          activeColor: Color(0xff4caf50),
                        ),
                        Text(
                          'Appartement',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 4,
                          groupValue: _mydemandetype,
                          onChanged: _handledemandetype,
                          activeColor: Color(0xff9962d0),
                        ),
                        Text(
                          'Garsoniere',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Colors.teal,
                        onPressed: () {
                          fireServ
                              .createDemande(
                                  _demandebudgetController.text,
                                  _demandedetailsController.text,
                                  demandeVal)
                              .then((_) {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          "Ajouter",
                          style: TextStyle(color: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
 
}