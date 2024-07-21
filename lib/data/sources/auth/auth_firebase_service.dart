import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotifyclone/data/models/auth/create_user_req.dart';
import 'package:spotifyclone/data/models/auth/signIn_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

    Future<Either> signin(SignInUser signInUser);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SignInUser signInUser) async{
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUser.email, password: signInUser.password);
      return const Right('SignIn was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong email and password';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return Right('Signup is Succesfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An Account already exists with that email.';
      }
      return Left(message);
    }
  }
}
