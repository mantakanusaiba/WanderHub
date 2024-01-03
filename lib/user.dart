class CustomUser {
  String _uid;
  String _name;
  String _email;
  String _role;

  CustomUser(this._uid, this._name, this._email , this._role);
  String get email => _email;
  String get name => _name;
  String get uid => _uid;
  String get role => _role;
  Map<String, dynamic> toJson() => {
    'uid': _uid,
    'name': _name,
    'email': _email,
    'role': _role,
  };
}