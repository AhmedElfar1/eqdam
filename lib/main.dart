import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/layout/layout_page.dart';
import 'package:eqdam_final/modules/login/cubit/cubit.dart';
import 'package:eqdam_final/modules/register/cubit/cubit.dart';
import 'package:eqdam_final/shared/bloc_observer.dart';
import 'package:eqdam_final/shared/components/components.dart';
import 'package:eqdam_final/shared/components/constants.dart';
import 'package:eqdam_final/shared/network/local/cache_helper.dart';
import 'package:eqdam_final/shared/network/remote/dio_helper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? token = await FirebaseMessaging.instance.getToken();
  print(token.toString());
  FirebaseMessaging.onMessage.listen((event)
  {
    showToast(message: 'on Message', state: ToastState.SUCCESS);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event)
  {
    showToast(message: 'on Message app', state: ToastState.SUCCESS);
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await CacheHelper.init();
  await DioHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit()..getCustomers()..getPartner(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state)
        {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              splashIconSize: double.infinity,
                splash: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/bg9.jpg'),
                    ),
                  ),
                  child: const Image(
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/images/logos.png'),),
                ),
                nextScreen: const LayoutPage()),
          );
        },
      ),
    );
  }
}
