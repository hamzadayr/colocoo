import 'package:cloud_firestore/cloud_firestore.dart';

class Offre{
  String oid;
  String adresse;
  String capacite;
  String superficie;
  String prix;
  Timestamp dateCreation;
  

  Offre({
    this.oid,
    this.adresse,
    this.capacite,
    this.superficie,
    this.prix,
    this.dateCreation
  });

}