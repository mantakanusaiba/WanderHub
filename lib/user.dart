class CustomUser {
  String _uid;
  String _name;
  String _email;

  CustomUser(this._uid, this._name, this._email);

  String get email => _email;
  String get name => _name;
  String get uid => _uid;
  Map<String, dynamic> toJson() => {
    'uid': _uid,
    'name': _name,
    'email': _email,
  };
}