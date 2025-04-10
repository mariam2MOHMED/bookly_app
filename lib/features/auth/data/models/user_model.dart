class UserModel{
  final String id;
  final String name;final String email;
    final String password;final List<bool> isSaved;

  UserModel({
    this.id="",
    required this.name,
    required this.email,
    required this.password,
    required this.isSaved});
  UserModel.fromJson(Map<String,dynamic>json):this(
    id: json["id"],
    name:json["name"],
    email:json["email"],
    password:json["password"],
    isSaved:json["isSaved"],
  );
  Map<String,dynamic>toJson()=>{
    "id":id,
    "name":name,
    "email":email,
    "password":password,
    "isSaved":isSaved,
  };
}