import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/layout_page.dart';
import 'package:eqdam_final/modules/login/cubit/cubit.dart';
import 'package:eqdam_final/modules/login/cubit/states.dart';
import 'package:eqdam_final/modules/register/register_screen.dart';
import 'package:eqdam_final/shared/components/components.dart';
import 'package:eqdam_final/shared/components/constants.dart';
import 'package:eqdam_final/shared/network/local/cache_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(
            message: state.error,
            state: ToastState.ERROR,
          );
        } else  if (state is CreateGoogleUserErrorState) {
          showToast(
            message: state.error,
            state: ToastState.ERROR,
          );
        }else if (state is CreateFaceBookUserErrorState) {
          showToast(
            message: state.error,
            state: ToastState.ERROR,
          );
        }
        if (state is LoginSuccessState) {
          showToast(
            message: 'Login Success',
            state: ToastState.SUCCESS,
          );
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            LayoutCubit.get(context).getEqdamData();
            LayoutCubit.get(context).getUserData();

            uId=state.uId;
            print(uId);
            navigateAndFinish(context, const LayoutPage());
          });
        } else if (state is LoginGoogleUserSuccessState) {
          showToast(
            message: 'Login With Google Success',
            state: ToastState.SUCCESS,
          );
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            LayoutCubit.get(context).getEqdamData();
            LayoutCubit.get(context).getUserData();
            uId=state.uId;
            print(uId);
            navigateAndFinish(context, const LayoutPage());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/bg4.jpg'))),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                            height: 1,
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Login Now To Communicate Us.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please inter your email address';
                              }
                              return null;
                            },
                            label: 'Email Address',
                            prefix: Icons.email_outlined),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is to short';
                            }
                            return null;
                          },
                          isPassword: LoginCubit.get(context).showPassword,
                          label: 'Password',
                          prefix: Icons.lock_outlined,
                          suffix: LoginCubit.get(context).suffixIcon,
                          suffixPressed: () {
                            LoginCubit.get(context).changeSuffixIcon(context);
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).signIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        BuildCondition(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'Login',
                            isUpperCase: true,
                            image: 'assets/images/login.png',
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Do not have an account !',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Cairo'),
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, RegisterScreen());
                              },
                              text: 'Register',
                            ),
                          ],
                        ),
                        const Center(
                          child: Text(
                            '-OR-',
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            // shape: RoundedRectangleBorder(borderRadius: ),
                            onPressed: () {
                              LoginCubit.get(context)
                                  .getGoogleUserCredentials();
                            },
                            child: Row(
                              children:
                              const [
                                Image(height: 25,image: AssetImage('assets/images/gmail.png'),),
                                SizedBox(
                                  width: 100,
                                ),
                                Text('Sign In With Google')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
