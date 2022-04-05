import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/shared/components/components.dart';

class AboutPageScreen extends StatelessWidget {
  const AboutPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              gradientText(
                                text: 'Who We Are',
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('5ec6e7'),
                                    HexColor('c9549f'),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Cairo',
                                  letterSpacing: .4,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                'Our company is considered one of the leading companies in the field of information systems,technology and digital marketing,',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    letterSpacing: .4,
                                    height: 1),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              gradientText(
                                text:
                                    'its goal has always been credibility, quality of services and customer satisfaction',
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('5ec6e7'),
                                    HexColor('c9549f'),
                                  ],
                                ),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: .4,
                                    fontFamily: 'Cairo'),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              gradientText(
                                text: 'WHAT WE DO & HOW WE DO',
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('5ec6e7'),
                                    HexColor('c9549f'),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Cairo',
                                  letterSpacing: .2,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Our company provides many services, including: ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    height: 1.2),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                '- Website design and development, ECommerce platforms.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    height: 1.2),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                '- and We excel in the design and development of administrative systems such as ERP, HRM, CRM ... Etc,',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    height: 1.2),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    '- mobile application development.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Cairo',
                                        height: 1.2),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                '- Domain name registration, hosting services and digital marketing in all its branches.',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    height: 1.2),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                '- Through implementing the latest and the most efficient techniques that assures the most creative and absolute solutions.',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    height: 1.2),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              gradientText(
                                text: 'Our Partners',
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor('5ec6e7'),
                                    HexColor('c9549f'),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Cairo',
                                  letterSpacing: .2,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CarouselSlider.builder(
                                options: CarouselOptions(

                                  height: 250.0,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      const Duration(seconds: 3),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                  viewportFraction: 1.2,
                                ),
                                itemCount:
                                    LayoutCubit.get(context).partners.length,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    color: Colors.white.withOpacity(.8),
                                    child: Image(
                                      height: 25,
                                      image: NetworkImage(LayoutCubit.get(context)
                                          .partners[index]
                                          .partnerImage!),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
