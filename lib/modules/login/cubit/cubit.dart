import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:eqdam_final/models/social_user_model.dart';
import 'package:eqdam_final/modules/login/cubit/states.dart';
import 'package:eqdam_final/shared/components/constants.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? loginModel;

  void signIn({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  bool userExist = false;
  Future <void> isUserExist({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic,

  }) async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      for (var element in value.docs) {
        if(element.id == uId) {
          userExist = true;
        }
      }
      if(userExist == false) {
        createGoogleUser(
            uId: uId,
            name: name,
            phone: phone,
            email: email,
            profilePic: profilePic
        );
      }
      else {
        emit(LoginGoogleUserSuccessState(uId!));
      }
    });
  }

  bool userExist2 = false;
  Future <void> isUserExist2({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic

  }) async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      for (var element in value.docs) {
        if(element.id == uId) {
          userExist2 = true;
        }
      }
      if(userExist2 == false) {
        createGoogleUser(
            uId: uId,
            name: name,
            phone: phone,
            email: email,
            profilePic: profilePic
        );
      }
      else {
        emit(LoginFaceBookUserSuccessState(uId!));
      }
    });
  }

  void getGoogleUserCredentials() async {
    emit(LoginGoogleUserLoadingState());
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isUserExist(
          uId: value.user!.uid,
          name: value.user!.displayName,
          phone: value.user!.phoneNumber,
          email: value.user!.email,
          profilePic: value.user!.photoURL
      );
      uId =value.user?.uid;
    });
  }


  void createGoogleUser({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic,
  }) {
    UserModel model = UserModel(
      uId: uId,
      name: name,
      phone: phone?? '0000-000-0000',
      email: email,
      profilePic: profilePic ?? 'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
        .then((value) {
      emit(CreateGoogleUserSuccessState(uId!));
    }).catchError((error) {
      emit(CreateGoogleUserErrorState(error));
    });
  }



  bool showPassword = false;
  IconData suffixIcon = Icons.visibility_off_outlined;

  void changeSuffixIcon(context) {
    showPassword = !showPassword;
    if (showPassword) {
      suffixIcon = Icons.visibility_outlined;
    } else {
      suffixIcon = Icons.visibility_off_outlined;
    }
    emit(ChangeSuffixIconState());

  }
UserModel? userModel;
  void getUserData() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      setUserToken();
      emit(GetUserSuccessState());
      print(value.data());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
      print(error);
    });
  }

  void setUserToken() async {
    emit(SetUSerTokenLoadingState());
    String? token = await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update({'token': token})
        .then((value) => emit(SetUSerTokenSuccessState()))
        .catchError((error) {
      emit(
        SetUSerTokenErrorState(error.toString()),
      );
      print(error);
    });
  }
}
// void createFaceBookUser({
//   required String? uId,
//   required String? name,
//   required String? phone,
//   required String? email,
//   required String? profilePic
// }) {
//   UserModel model = UserModel(
//     uId: uId,
//     name: name,
//     phone: phone?? '0000-000-0000',
//     email: email,
//     profilePic: profilePic ?? 'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
//   );
//   FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
//       .then((value) {
//     emit(CreateFaceBookUserSuccessState(uId!));
//   }).catchError((error) {
//     emit(CreateFaceBookUserErrorState(error));
//   });
// }