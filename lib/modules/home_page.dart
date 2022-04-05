import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/shared/components/components.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: const Color.fromRGBO(255, 246, 252, 1),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/images/logo.png'),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/card.jpg'))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSelectedIcon(
                            image: 'assets/images/web.png',
                            text: 'Web Development',
                            function: () {
                              cubit.selectedIndex = 1;
                              cubit.changeSelected();
                            },
                            color: cubit.selectedIndex == 1
                                ? Colors.blue[50]
                                : Colors.white,
                          ),
                          buildSelectedIcon(
                            image: 'assets/images/process.png',
                            text: 'Web based management systems',
                            function: () {
                              cubit.selectedIndex = 2;
                              cubit.changeSelected();
                            },
                            color: cubit.selectedIndex == 2
                                ? Colors.blue[50]
                                : Colors.white,
                          ),
                          buildSelectedIcon(
                            image: 'assets/images/app.png',
                            text: 'Mobile & Desktop Applications',
                            function: () {
                              cubit.selectedIndex = 3;
                              cubit.changeSelected();
                            },
                            color: cubit.selectedIndex == 3
                                ? Colors.blue[50]
                                : Colors.white,
                          ),
                        ],
                      ),
                      if (cubit.selectedIndex == 1)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/msg1.png'))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 32, bottom: 20, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    'Web Development',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Websites are the number one medium that major marketers rely on as a marketing channel to market the products and services offered. It is a method that must be present in companies, factories, service and commercial institutions, and others.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  rowBuilder(
                                      text: 'Websites',
                                      image: 'assets/images/www.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Online Stores',
                                      image: 'assets/images/store.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'E-commerce',
                                      image: 'assets/images/ec.png'),

                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (cubit.selectedIndex == 2)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/msg2.png'))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 32, bottom: 28, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    'Web based management systems',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'ERP - Enterprise resource planning',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    'HRM - Human resource management',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    'CRM - Customer relationship management',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    'POS - Point of  sales systems',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  rowBuilder(
                                      text: 'ERP ',
                                      image: 'assets/images/enterprise.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'HRM',
                                      image: 'assets/images/hrm.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'CRM',
                                      image: 'assets/images/crm.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'POS',
                                      image: 'assets/images/cashier.png'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (cubit.selectedIndex == 3)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/msg3.png'))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 32, bottom: 28, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Phone And Desktop Applications',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Phone applications are one of the most powerful marketing methods that companies use today. The application in its general form is a program that remains on the user’s device 24 hours a day.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  rowBuilder(
                                    text: 'Android',
                                    image: 'assets/images/android.png',
                                  ),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Ios',
                                      image: 'assets/images/apple.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Desktop',
                                      image: 'assets/images/app2.png'),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildSelectedIcon(
                            image: 'assets/images/megaphone.png',
                            text: 'Digital Marketing',
                            function: () {
                              cubit.selectedIndex = 4;
                              cubit.changeSelected();
                            },
                            color: cubit.selectedIndex == 4
                                ? Colors.blue[50]
                                : Colors.white,
                          ),
                          buildSelectedIcon(
                            image: 'assets/images/design.png',
                            text: 'Visuals Design',
                            function: () {
                              cubit.selectedIndex = 5;
                              cubit.changeSelected();
                            },
                            color: cubit.selectedIndex == 5
                                ? Colors.blue[50]
                                : Colors.white,
                          ),
                          buildSelectedIcon(
                            image: 'assets/images/cloud.png',
                            text: 'Web Hosting Services',
                            function: () {
                              cubit.selectedIndex = 6;
                              cubit.changeSelected();
                            },
                            color: cubit.selectedIndex == 6
                                ? Colors.blue[50]
                                : Colors.white,
                          ),
                        ],
                      ),
                      if (cubit.selectedIndex == 4)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/msg1.png'))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 32, bottom: 28, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    'Digital Marketing',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Marketing plans and strategies, Content Marketing, Social Media Marketing, Ads, SEO, SEM and chatbots.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                          color: Colors.grey[200],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Image(
                                              width: 25,
                                              image: AssetImage(
                                                  'assets/images/planning.png'),
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Marketing Strategies And Plans',
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Content Marketing',
                                      image:
                                          'assets/images/content-marketing.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Social Media Marketing',
                                      image: 'assets/images/social-media.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'ADS',
                                      image:
                                          'assets/images/online-advertising.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'SEO',
                                      image: 'assets/images/startup.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'SEM',
                                      image: 'assets/images/sem.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'ChatBots',
                                      image: 'assets/images/chat.png'),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (cubit.selectedIndex == 5)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/msg2.png'))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 32, bottom: 28, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Visuals Design',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'visual identity, Publications Design, social media designs, motion graphic, video editing and voice over',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  rowBuilder(
                                    text: 'Visual Identity',
                                    image: 'assets/images/logo-design.png',
                                  ),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Publications Design',
                                      image: 'assets/images/documents (1).png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Social Media Designs',
                                      image: 'assets/images/post.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Motion Graphic',
                                      image: 'assets/images/motion-graphic.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Video Editing',
                                      image: 'assets/images/movie.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Voice Over',
                                      image: 'assets/images/dubbing.png'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (cubit.selectedIndex == 6)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/msg3.png'))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 32, bottom: 28, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Web Hosting Services',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Domain registration, Servers hosting, official E-mails and website & hosting security services',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  rowBuilder(
                                      text: 'Websites',
                                      image: 'assets/images/www.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'Online Stores',
                                      image: 'assets/images/store.png'),
                                  const Divider(),
                                  rowBuilder(
                                      text: 'E-commerce',
                                      image: 'assets/images/ec.png'),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
