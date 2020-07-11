import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:co_loco/welcome.dart';
import 'package:provider/provider.dart';
import 'current_user.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  String token;



  @override
  void initState() {

    super.initState();
    debugPrint(token);

  }

  _LoginPageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          LoginScreen(),
        ],
      ),
    );
  }
}


class LoginScreen extends StatefulWidget {
 
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
  with TickerProviderStateMixin {
  

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget HomePage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.teal,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.1), BlendMode.dstATop),
          image: AssetImage('assets/images/mnali.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 250.0),
            child: Center(
              child: Icon(
                Icons.hotel,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Student",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  " -CoLoCo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    borderSide: BorderSide(width: 1,color: Colors.white),
                    highlightedBorderColor: Colors.black87,
                    onPressed: () => gotoSignup(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "S'INSCRIRE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "S'IDENTIFIER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold),
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


  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Container(
            width:50,
              height:50,
              child: Center(child: new CircularProgressIndicator())
          ),

        );
      },
    );
  }


  Widget LoginPage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: new ListView(
        children: <Widget>[
         SizedBox(height: 100,),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 15.0,
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
                    controller: _mailController,
                    cursorColor: Colors.teal,
                    style: TextStyle(
                      color: Colors.teal
                    ),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Saisir adresse mail ...',
                      fillColor: Colors.teal,
                      hintStyle: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Quicksand'),
                    ),
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
                    "PASSWORD",
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
                    controller: _passController,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.teal
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 15.0,
                      fontFamily: 'Quicksand'
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.teal,
                    onPressed: ()async {
                       Provider.of<CurrentUser>(context).changeToken('demo');
                     // Provider.of<Auth>(context).login();
                      _loginUser(_mailController.text , _passController.text, context);
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
                                                    "S'IDENTIFIER",
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
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      new Expanded(
                                        child: new Container(
                                          margin: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(border: Border.all(width: 0.25),color: Colors.teal),
                                        ),
                                      ),
                                      Text(
                                        "Ou bien connecté avec",
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Quicksand'
                                        ),
                                      ),
                                      new Expanded(
                                        child: new Container(
                      
                                          margin: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(border: Border.all(width: 0.25),color: Colors.teal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                                  child: new Row(
                                    children: <Widget>[
                                      new Expanded(
                                        child: new Container(
                                          margin: EdgeInsets.only(right: 8.0),
                                          alignment: Alignment.center,
                                          child: new Row(
                                            children: <Widget>[
                                              new Expanded(
                                                child: new OutlineButton(
                                                  color: Colors.teal,
                                                  highlightedBorderColor: Colors.teal,
                                                  borderSide: BorderSide(color: Colors.teal),
                                                  shape: new RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(30.0),
                                                  ),
                      
                                                  onPressed: () => {},
                                                  child: new Container(
                                                    child: new Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        new Expanded(
                                                          child: new FlatButton(
                                                            onPressed: ()=>{},
                                                            padding: EdgeInsets.only(
                                                              top: 15.0,
                                                              bottom: 15.0,
                                                            ),
                                                            child: new Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceEvenly,
                                                              children: <Widget>[
                      
                                                                Text(
                                                                  "FACEBOOK",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                      color: Colors.teal,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: 'Quicksand'
                                                                  ),
                                                                ),
                                                              ],
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
                                      ),
                                      new Expanded(
                                        child: new Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          alignment: Alignment.center,
                                          child: new Row(
                                            children: <Widget>[
                                              new Expanded(
                                                child: new OutlineButton(
                                                  color: Colors.teal,
                                                  borderSide: BorderSide(color: Colors.teal),
                                                  shape: new RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(30.0),
                                                  ),
                                                  onPressed: () => {},
                                                  child: new Container(
                                                    child: new Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        new Expanded(
                                                          child: new FlatButton(
                      
                                                            onPressed: ()=>{},
                                                            padding: EdgeInsets.only(
                                                              top: 15.0,
                                                              bottom: 15.0,
                                                            ),
                                                            child: new Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceEvenly,
                                                              children: <Widget>[
                      
                                                                Text(
                                                                  "GOOGLE",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                      color: Colors.teal,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: 'Quicksand'
                                                                  ),
                                                                ),
                                                              ],
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
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      
                      
                        Widget SignupPage() {
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
                                             "Nom",
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
                                           controller: _nameController,
                                          style: TextStyle(
                                             color: Colors.teal
                                         ),
                                         cursorColor: Colors.teal,
                                         textAlign: TextAlign.left,
                                         decoration: InputDecoration(
                                           border: InputBorder.none,
                                           hintText: 'Nom complet ...',
                                           hintStyle: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Quicksand'),
                                         ),
                                        
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
                                          "EMAIL",
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
                                          controller: _mailController,
                                          style: TextStyle(
                                              color: Colors.teal
                                          ),
                                          cursorColor: Colors.teal,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Votre adresse email ...',
                                            hintStyle: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Quicksand'),
                                          ),
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
                                          "PHONE NO",
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
                                          controller: _phoneController,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.teal
                                          ),
                                          keyboardType: TextInputType.number,
                                          cursorColor: Colors.teal,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                      
                                            hintText: '06207689508',
                                            hintStyle: TextStyle(color: Theme.of(context).accentColor),
                                          ),
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
                                          "PASSWORD",
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
                                          controller: _passController, 
                                          obscureText: true,
                                          style: TextStyle(
                                              color: Colors.teal
                                          ),
                                          cursorColor: Colors.teal,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '*********',
                                            hintStyle: TextStyle(color: Theme.of(context).accentColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 24.0,
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20.0),
                                      child: new FlatButton(
                                        child: new Text(
                                          "Vous avez deja un compte ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                            fontSize: 15.0,
                                            fontFamily: 'Quicksand'
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        onPressed: () => gotoLogin(),
                                      ),
                                    ),
                                  ],
                                ),
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
                                  alignment: Alignment.center,
                                  child: new Row(
                                    children: <Widget>[
                                      new Expanded(
                                        child: new FlatButton(
                                         onPressed: () {
                                            _signUpUser_l(_mailController.text,_passController.text,context,_nameController.text, _phoneController.text);                   
                                                               },
                                                                shape: new RoundedRectangleBorder(
                                                                  borderRadius: new BorderRadius.circular(30.0),
                                                                ),
                                                                color: Colors.teal,
                                                              
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
                                                                                                "SIGN UP",
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
                                                                  
                                                                    gotoLogin() {
                                                                      //controller_0To1.forward(from: 0.0);
                                                                      _controller.animateToPage(
                                                                        0,
                                                                        duration: Duration(milliseconds: 800),
                                                                        curve: Curves.bounceOut,
                                                                      );
                                                                    }
                                                                  
                                                                    gotoSignup() {
                                                                      //controller_minus1To0.reverse(from: 0.0);
                                                                      _controller.animateToPage(
                                                                        2,
                                                                        duration: Duration(milliseconds: 800),
                                                                        curve: Curves.bounceOut,
                                                                      );
                                                                    }
                                                                  
                                                                    PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);
                                                                  
                                                                    @override
                                                                    Widget build(BuildContext context) {
                                                                       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
                                                                          statusBarColor: Colors.teal,
                                                                          //or set color with: Color(0xFF0000FF)
                                                                          statusBarBrightness: Brightness.light));
                                                                      return Container(
                                                                          height: MediaQuery.of(context).size.height,
                                                                          child: PageView(
                                                                            controller: _controller,
                                                                            physics: new AlwaysScrollableScrollPhysics(),
                                                                            children: <Widget>[LoginPage(), HomePage(), SignupPage()],
                                                                            scrollDirection: Axis.horizontal,
                                                                          ));
                                                                    }
                                            
                       void _signUpUser_l(String email, String password , BuildContext context,String fullname,String phonenumber) async{
                          CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
                      
                          try{
                      
                            String _returnString = await _currentUser.addUser(email, password,fullname,phonenumber);
                            if(_returnString== "success"){
                              Navigator.pop(context);
                            }else{
                              Scaffold.of(context).showSnackBar(
                                     SnackBar(content: Text(_returnString),
                                     duration: Duration(seconds: 60),
                                     )
                                   );
                            }
                          }
                          catch(e) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text(e.message),
                                    actions: [
                                      FlatButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          };
                        }
                      
                        void _loginUser(String email, String password , BuildContext context) async{
                          CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
                          try{
                              String _returnString = await _currentUser.loginUser(email, password);
                            if(_returnString== "success"){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                builder: (context)=> WelcomeScreen(),
                                ),
                              );
                            } else{
                              Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(_returnString),
                                    duration: Duration(seconds: 10),
                                    )
                                  );
                            }
                          }
                          catch(e){
                          }
                        }
                      
}
