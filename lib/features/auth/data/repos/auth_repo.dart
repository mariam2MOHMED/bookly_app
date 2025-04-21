import 'package:booklyapp/core/utils/errors/firebase_errors.dart';
import 'package:booklyapp/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo{
  Future<Either<ErrorFirebase,UserModel>>createUser(String name,String email,String password);
  Future<Either<ErrorFirebase,UserModel>>login(String email,String password);
  Future<Either<ErrorFirebase,void>> forgetPassword(String email);
}