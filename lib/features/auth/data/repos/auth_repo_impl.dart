

import 'package:booklyapp/core/utils/errors/firebase_errors.dart';
import 'package:booklyapp/features/auth/data/models/user_model.dart';
import 'package:booklyapp/features/auth/data/repos/auth_repo.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either<ErrorFirebase, UserModel>> createUser
      (String name, String email, String password) async{

try{
  final crediental =await FirebaseAuth.instance.createUserWithEmailAndPassword
    (email: email, password: password);
  final user=getUsersCollection();
  final usermodel=UserModel(
id: crediental.user!.uid,
      name: name, email: email,
      password: password);
  user.doc(usermodel.id).set(usermodel);
  return right(usermodel);
}catch(e){
  if(e is FirebaseAuthException){
    return left(ErrorFirebase.fromFirebase(e));
  }else{
    return left(ErrorFirebase(errorMessage: e.toString()));
  }
}

  }

  @override
  Future<Either<ErrorFirebase, UserModel>> login(String email, String password)async {

    try{
      final crediential=await FirebaseAuth.instance
          .signInWithEmailAndPassword
        (email: email, password: password);
      final user=getUsersCollection();
     final doc= await user.doc(crediential.user!.uid).get();
      return right(doc.data()!);
    }catch(e){
      if(e is FirebaseAuthException){
        return left(ErrorFirebase.fromFirebase(e));
      }else{
        return left(ErrorFirebase(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<ErrorFirebase, void>> forgetPassword(String email)async {
 try{
   final crediential=await FirebaseAuth.instance;
   crediential.sendPasswordResetEmail(email: email);
   return right(null);
 }catch(e){
   if(e is FirebaseAuthException){
     return left(ErrorFirebase.fromFirebase(e));
   }else{
     return left(ErrorFirebase(errorMessage: e.toString()));
   }
 }
  }}
 CollectionReference<UserModel>  getUsersCollection(){
  return  FirebaseFirestore.instance.collection("users").
  withConverter<UserModel>
    (fromFirestore: (docsnapshot,_)=>
      UserModel.fromJson(docsnapshot.
      data()!),
      toFirestore:(user,_)=>user.toJson());
 }
CollectionReference<BookModel> getBooksCollection(String userId){
 var coll=  getUsersCollection().doc(userId).collection("books").withConverter
    (fromFirestore: (docSnapshot,_)=>BookModel.fromJson(docSnapshot.data()!),
      toFirestore: (book,_)=>book.toJson());
 print('Books collection path: ${coll.path}');
 return coll;
}
UserModel? getCurrentUserModel() {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  if (firebaseUser == null) {
    print('No authenticated user found');
    return null;
  }
  return UserModel(id: firebaseUser.uid);
}