class Loginbody{

  final String username;
  final String password;

  Loginbody({ this.username, this.password});

  factory Loginbody.fromJson(Map<String,dynamic> json){
    return Loginbody(
      username: json['username'],
      password: json['password'],);

  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    return map;
  }

}