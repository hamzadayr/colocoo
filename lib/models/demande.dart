class Demande {
  String _demandebudget;
  String _demandedetails;
  String _demandetype;
  Demande(this._demandebudget, this._demandedetails, this._demandetype);
  Demande.map(dynamic obj) {
    this._demandebudget = obj['demandebudget'];
    this._demandedetails = obj['demandedetails'];
    this._demandetype = obj['demandetype'];
  }
  String get demandebudget => _demandebudget;
  String get demandedetails => _demandedetails;
  String get demandetype => _demandetype;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['demandebudget'] = _demandebudget;
    map['demandedetails'] = _demandedetails;
    map['demandetype'] = _demandetype;
    return map;
  }
  Demande.fromMap(Map<String, dynamic> map) {
    this._demandebudget = map['demandebudget'];
    this._demandedetails = map['demandedetails'];

    this._demandetype = map['demandetype'];
  }
}