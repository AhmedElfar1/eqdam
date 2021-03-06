import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eqdam_final/models/social_user_model.dart';
import 'package:eqdam_final/modules/register/cubit/states.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,

    )
        .then((value) {
      userCrate(name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,

      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error);
    });
  }

  void userCrate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  })
  {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance.collection('users').doc(uId)
        .set(model.toMap()).then((value)
    {
     emit(CreateUserSuccessState());
    }).catchError((error)
    {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
  void change()
  {
    emit(ChangeState());
  }

}
