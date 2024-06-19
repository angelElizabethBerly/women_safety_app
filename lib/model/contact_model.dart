class TruContact {
  int? _id;
  String? _number;
  String? _name;

  TruContact(this._number, this._name);
  TruContact.withId(this._id, this._number, this._name);

  @override
  String toString() {
    return 'Contact: {id :$_id, name:$_name, number:$_number}';
  }

  //getters
  int get id => _id!;
  String get number => _number!;
  String get name => _name!;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this._id;
    map['number'] = this._number;
    map['name'] = this._name;
    return map;
  }

  TruContact.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._number = map['number'];
    this._name = map['name'];
  }
}
