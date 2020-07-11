
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:co_loco/models/user.dart';
import 'package:co_loco/services/db.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CurrentUser extends ChangeNotifier{
  User _currentUser = User(); 
  User get getCurrentUser => _currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _state = false;
  String _token;
  String get token => _token;
  bool get state => _state;

Future<String> onStartUp() async{
  String retVal = "error";
  try{
    FirebaseUser _firebaseUser = await _auth.currentUser();
    _currentUser.uid = _firebaseUser.uid;
    _currentUser.email = _firebaseUser.email;
    retVal="success";
  }
  catch(e){
    print(e);
  }
    return retVal;
}

Future<String> signOut()async{
  String retVal = "error";
   try{
  await _auth.signOut();
   _currentUser = User();
   retVal="success";
 }
 catch(e){
   print(e);
 }
  return retVal;
}

Future<String> addUser(String email,String password,String fullname,String phoneNumber)async{
String retVal = "error";
User _user = User();
try{
  AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  _user.uid = _authResult.user.uid;
  _user.email = _authResult.user.email;
  _user.name = fullname;
  _user.phone= phoneNumber;
  String _returnString = await ConnexionDatabase().createUser(_user.uid,_user.email,_user.name ,_user.phone);
  if(_returnString=="success"){
    retVal="success";
  }
}catch(e){
retVal = e.message;
}
return retVal;
}


Future<String> loginUser(String email,String password)async{
    String retVal ="error";
    try{
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
        _currentUser.uid = _authResult.user.uid;
        _currentUser.email = _authResult.user.email;
        
         final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', _token);
          _state = true;
          print('Login');
          notifyListeners();

        retVal= "success";
    }catch(e){
    retVal = e.message;
    }
    return retVal;
    }


    void changeToken(t) async{
      _token = t;
      notifyListeners();
    }

    void logout() async{
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      _state = false;
      print('Logout');
      notifyListeners();
    }

  }