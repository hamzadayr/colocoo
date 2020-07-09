import 'package:flutter/material.dart';
import 'hotel.dart';
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
              expandedHeight: _height/6.5,
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
                          child: Text('Recommandé pour vous',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),
                          ),
                        ),
                        
                        SizedBox(width: 100),
                        ClipOval(
                          child: Material(
                            color: Colors.teal[300], // button color
                            child: InkWell(
                              splashColor: Colors.teal[100], // inkwell color
                              child: SizedBox(width: 56, height: 56, child: Icon(Icons.add)),
                              onTap: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddOffre()),
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
                    itemCard('Grande appartement ','assets/images/app1.jpg',false),
                    itemCard('Petit Villa','assets/images/app2.jpg',false),
                    itemCard('Appartement ','assets/images/app3.jpg',false),
                    itemCard('Garsoniere','assets/images/app4.jpg',false),
                    itemCard('Studio ','assets/images/app1.jpg',false)
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
          MaterialPageRoute(builder: (context) => SingleHotel()),
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



  
  Widget itemCard(String title, String imgPath, bool isFavorite) {
  return  GestureDetector (
       onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleHotel()),
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
            Container(
              width: 140.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(

                    image: AssetImage(imgPath), fit: BoxFit.cover)),
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
                    title,
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
                      '22/06/2020 12:00',
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
                        '3000 DH',
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
                      child: Text('Appelez',style: TextStyle(
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
