import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../map.dart';
import 'singleOffre.dart';
import 'nvl_offre.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _width;
  double _height;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: GestureDetector(child: Icon(Icons.menu),onTap: () =>
                  Scaffold.of(context).openDrawer(),),
              expandedHeight: _height/5,
              floating: false,
              pinned: true,
              backgroundColor: Colors.teal,
              //#f02730
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                titlePadding: EdgeInsets.only(top: 30.0),
                title: Center(
                  child: Text(
                    "Student-CoLoCo",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins-regular',
                        fontSize: 22),
                  ),
                ),
              ),
              bottom: PreferredSize(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10,top:10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    width: _width,
                    //height: _height/15,
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.only(left: 15.0, top: 0.0,bottom: 0),
                          prefixIcon: Icon(Icons.search, size: 20,color: Colors.grey,),
                          hintText:"Rechercher les offres de Student-CoLoCo",hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,fontFamily: 'poppins-regular'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  preferredSize: Size(_width,_height/45)),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
             

              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Row(
                      children: <Widget>[
                          Container(
                          padding:EdgeInsets.fromLTRB(5,0,10,0),
                          child: Text('Vos Offres',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),
                          ),
                        ),
                        
                        SizedBox(width: 220),
                        ClipOval(
                          child: Material(
                            color: Colors.teal[300], // button color
                            child: InkWell(
                              splashColor: Colors.teal[100], // inkwell color
                              child: SizedBox(width: 56, height: 56, child: Icon(Icons.add)),
                              onTap: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RunMap()),
                                );
                              },
                            ),
                          ),
                        ),
                        ],
                    ),
                    

                    SizedBox(height:10),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildApp_design1("assets/images/app1.jpg"),
                          _buildApp_design1("assets/images/app2.jpg"),
                          _buildApp_design1("assets/images/app3.jpg"),
                          _buildApp_design1("assets/images/app4.jpg"),
                          _buildApp_design1("assets/images/app1.jpg"),

                          

                        ],
                      ),
                    ),
                
                  SizedBox(height:10),
                  Container(
                      padding:EdgeInsets.fromLTRB(5,0,10,0),
                      child: Text('Dernière offres de Student-CoLoCo',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
           
                   SizedBox(height:20),




               StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection("offres").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) return new Text('${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Center(child: new CircularProgressIndicator());
                    default:

                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListView(
                              shrinkWrap: true,
                              children: snapshot.data.documents.map(
                                (DocumentSnapshot document) {
                                  return  itemCard( document['prix'], document['superficie'], document['capacite'],document['image'],"11/07/2020",false);
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
        




           
                  //  itemCard('Garsoniere','assets/images/app4.jpg',false),
                   // itemCard('Studio ','assets/images/app1.jpg',false),
                    
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }


  Widget _buildApp_design1(var villa){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleOffre()),
        );
      },
      child: Container(
        width:180,
        height:200,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4)
                ),
                child:Container(height:_height*0.15,width:_width,child: Image.asset(villa,fit: BoxFit.cover,)),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nouvelle villa ',
                      style: TextStyle(
                          fontFamily: "poppins-regular",
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  
  Widget itemCard(String prix, String superficie, String capacite, String imgPath, String dte, bool isFavorite) {
  return  GestureDetector (
       onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleOffre()),
        );
      },
    child: Column(
      children: <Widget>[
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
                        child: Image.network(imgPath,
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
                    superficie+" pour "+capacite+" personnes" ,
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
                      dte,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),
                  Icon(Icons.star,color: Colors.orange[100],size: 15,),


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
                        prix,
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 35.0),

                  Container(
                    child: FlatButton(
                      color: Colors.teal,
                      onPressed: (){},
                      textColor: Colors.white,
                      child: Text('Détails',style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )
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
 );
}


}
