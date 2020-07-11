import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Offre{
  String oid;
  String uid;
  String capacite;
  String superficie;
  String prix;
  
  String adresseX;
  String adresseY;
  String tele;

  List supplimentaires;
  File image;
  Timestamp dateCreation;
  
  

  Offre({
    this.oid,
    this.uid,
    this.capacite,
    this.superficie,
    this.prix,

    this.adresseX,
    this.adresseY,
    this.tele,

    this.supplimentaires,
    this.image,
    this.dateCreation
  });

}