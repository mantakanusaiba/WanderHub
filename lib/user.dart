class CustomUser {
  String _uid;
  String _name;
  String _email;
  String _phone;
  String _role;
  String? _profileImageUrl;

  CustomUser(this._uid, this._name, this._email, this._phone, this._role,
      {String? profileImageUrl})
      : _profileImageUrl = profileImageUrl ?? "";

  String get email => _email;
  String get name => _name;
  String get uid => _uid;
  String get phone => _phone;
  String get role => _role;
  String? get profileImageUrl => _profileImageUrl;

  Map<String, dynamic> toJson() => {
    'uid': _uid,
    'name': _name,
    'email': _email,
    'phone': _phone,
    'role': _role,
    'profileImageUrl': _profileImageUrl,
  };
}