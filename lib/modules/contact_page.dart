import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/modules/chat_details_screen.dart';
import 'package:eqdam_final/shared/components/components.dart';
import 'package:eqdam_final/shared/components/constants.dart';
import 'package:eqdam_final/shared/network/local/cache_helper.dart';
import 'package:url_launcher/link.dart';
import 'login/login_screen.dart';

class ContactPageScreen extends StatelessWidget {
  const ContactPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state)
      {
        if(state is LogoutSuccessState)
          {
            CacheHelper.removeData(key: 'uId',);
          }
      },
      builder: (context, state) {
        return SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/bg4.jpg',),),),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/images/lg.png',
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    if(uId ==null)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: defaultButton(
                        function: ()
                        {
                          navigateTo(context, LoginScreen());
                        },
                        text: 'Login To Communicate',
                        isUpperCase: true,
                        image: 'assets/images/chat1.png',
                        color: HexColor('016987')
                      ),
                    ),
                    if(uId != null)
                      Column(
                        children:
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                            child: defaultButton(
                                color: Colors.white,
                                backGround: Colors.blue,
                                function:
                                    ()
                                {
                                  LayoutCubit.get(context).getUserData();
                                  LayoutCubit.get(context).getEqdamData();
                                  navigateTo(context, ChatDetailsScreen());
                                },
                                text: 'Live Chat',
                                image: 'assets/images/lChat.png'
                            ),
                          ),
                          Link(uri: Uri.parse('https://www.facebook.com/eqdamtech'), builder:(context,followLink){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                              child: defaultButton(
                                  function: followLink!,
                                  text: 'FaceBook Page',
                                  image: 'assets/images/fb.png'
                              ),
                            );
                          }, ),
                          Link(uri: Uri.parse('https://wa.me/+201020299790'), builder:(context,followLink){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                              child: defaultButton(
                                  function: followLink!,
                                  text: 'WhatsApp',
                                  image: 'assets/images/wa.png'
                              ),
                            );
                          }, ),

                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultTextButton(
                                  function: ()
                                  {
                                    LayoutCubit.get(context).logout();
                                  }, text: 'Logout'),
                              Image(width: 25,image: const AssetImage('assets/images/logOut.png'),color:Colors.cyanAccent.withOpacity(.6) ,)
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text('3rd Area - next to Sadat city specialized hospital - building 10 - Sadat city - menofia - Egypt',
                          style: TextStyle(color: Colors.white,fontFamily: 'Cairo',fontSize: 16,fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 16,
                        ),
                        Link(
                          builder: ( context, followLink)
                          {
                            return TextButton(
                            onPressed: followLink,
                          child: const Text('Phone Number :    +20 1020299790',
                          style: TextStyle(color: Colors.white,fontFamily: 'Cairo',fontSize: 16,fontWeight: FontWeight.bold),),
                          ) ;
                          },
                          uri:Uri.parse('tel:+201020299790') ,),

                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
