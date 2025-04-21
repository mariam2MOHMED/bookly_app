import 'package:booklyapp/features/home/data/models/book_model.dart';

class UserModel{
   String id;
   String name; String email;
     String password;

  UserModel({
    required  this.id,
     this.name="",
     this.email="",
     this.password="",
   });
  UserModel.fromJson(Map<String,dynamic>json):this(
    id: json["id"],
    name:json["name"],
    email:json["email"],
    password:json["password"],

  );
  Map<String,dynamic>toJson()=>{
    "id":id,
    "name":name,
    "email":email,
    "password":password,

  };
}