import 'models/offre.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConnexionDatabase{
  final Firestore _firestore = Firestore.instance;

  Future<String> createOffre(Offre offre)async{
    String retVal = "error";
     try{
       await _firestore.collection("offres").document(offre.oid).setData({
          'adresse' : offre.adresse,
          'prix' : offre.prix,
          'capacite' : offre.capacite,
          'superficie' : offre.superficie,
          'accountCreated' : Timestamp.now(),
            });
       retVal="success";
     }
     catch(e){
       print(e);
     }
     return retVal;
  }
}