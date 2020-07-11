import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/demande.dart';

import '../models/offre.dart';


class ConnexionDatabase{
  final Firestore _firestore = Firestore.instance;
  final CollectionReference myCollection = Firestore.instance.collection('Demandes');

  Future<String> createUser(String uid ,String name , String phone , String mail)async{
      String retVal = "error";
      try{
        await _firestore.collection("users").document(uid).setData({
            'name' : name,
            'email' : mail,
            'phone' : phone,
            'accountCreated' : Timestamp.now(),
        });
        retVal="success";
      }
      catch(e){
        print(e);
      }
      return retVal;
  }


  Future<String> createOffre(Offre offre , BuildContext cntx)async{
    String retVal = "error";
     try{
       
       String filename = offre.image.path.split('/').last;
       final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child(filename);
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(offre.image);

        StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

        var downloadUrl = await storageSnapshot.ref.getDownloadURL();

       await _firestore.collection("offres").document(offre.oid).setData({
          'uid' : offre.uid,
          'prix' : offre.prix,
          'capacite' : offre.capacite,
          'superficie' : offre.superficie,
          'long' : offre.adresseX,
          'latit' : offre.adresseY,
          'tele' : offre.tele,
          'supplimentaires' : offre.supplimentaires,
          'image' : downloadUrl,
          'dateCreation' : Timestamp.now(),
         });

        if (uploadTask.isComplete) {
            var url = downloadUrl.toString();
            print("opération effectué avec succes !");
            Scaffold.of(cntx).showSnackBar(SnackBar(content : Text('opération effectué avec succes !')));

        }


       retVal="success";
     }
     catch(e){
       print(e);
     }
     return retVal;
  }

  Future<Demande> createDemande(String demandebudget, String demandedetails,String demandetype) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document());
      final Demande demande = new Demande(
          demandebudget, demandedetails, demandetype);
      final Map<String, dynamic> data = demande.toMap();
      await tx.set(ds.reference, data);
      return data;
    };
    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Demande.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getDemandeList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();
    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  
}


