// ignore_for_file: avoid_function_literals_in_foreach_calls, unnecessary_string_interpolations, prefer_if_null_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/models/customers_model.dart';
import 'package:eqdam_final/models/message_model.dart';
import 'package:eqdam_final/models/partner_model.dart';
import 'package:eqdam_final/models/social_user_model.dart';
import 'package:eqdam_final/modules/about_page.dart';
import 'package:eqdam_final/modules/contact_page.dart';
import 'package:eqdam_final/modules/home_page.dart';
import 'package:eqdam_final/modules/works_page.dart';
import 'package:eqdam_final/shared/components/constants.dart';
import 'package:eqdam_final/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomePageScreen(),
    const AboutPageScreen(),
    const WorksPageScreen(),
    const ContactPageScreen(),
  ];

  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(LayoutBottomNavState());
  }

  int selectedIndex = 0;

  void changeSelected() {
    selectedIndex;
    emit(HomeSelectedState());
  }

  List<UserModel> users = [];
  UserModel? userModel;
  UserModel? userModel2;

  void getEqdamData() {
    emit(GetEqdamLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc('Eqdam')
        .get()
        .then((value) {
      userModel2 = UserModel.fromJson(value.data()!);
      emit(GetEqdamSuccessState());
      print(value.data());
    }).catchError((error) {
      emit(GetEqdamErrorState(error.toString()));
      print(error);
    });
  }

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

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      uId = null;
      emit(LogoutSuccessState());
    });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: userModel!.uId,
      receiverId: 'Eqdam',
      dateTime: dateTime,
    );
    //set my chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc('Eqdam')
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
    //set receiver chats
    FirebaseFirestore.instance
        .collection('users')
        .doc('Eqdam')
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc('Eqdam')
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(GetMessageSuccessState());
    });
  }

  void sendFCMNotification({
    required String? token,
    required String? senderName,
    String? messageText,
  }) {
    DioHelper.postData(
        data: {
      "to": "$token",
      "notification": {
        "title": "$senderName",
        "body": "$messageText",
        "sound": "default"
      },
      "android": {
        "Priority": "HIGH",
      },
      "data": {
        "type": "order",
        "id": "87",
        "click_action": "FLUTTER_NOTIFICATION_CLICK"
      }
    });
    emit(SendMessageSuccessState());
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
  List<CustomersModel> customers = [];
  List<String> customersId = [];
  CustomersModel? customersModel;
  void getCustomers() {
    FirebaseFirestore.instance.collection('customers').get().then(
          (value) {
        customersId = [];
        value.docs.forEach(
              (element) {
            customersId.add(element.id);
            customers.add(CustomersModel.fromJson(element.data()));
          },
        );
        emit(GetCustomersSuccessState());
      },
    );
  }

  List<PartnerModel> partners = [];
  List<String> partnersId = [];
  PartnerModel? partnersModel;
  void getPartner() {
    FirebaseFirestore.instance.collection('partners').get().then(
          (value) {
        partnersId = [];
        value.docs.forEach(
              (element) {
            partnersId.add(element.id);
            partners.add(PartnerModel.fromJson(element.data()));
          },
        );
        emit(GetPartnersSuccessState());
      },
    );
  }
}
