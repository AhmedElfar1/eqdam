import 'package:carousel_slider/carousel_slider.dart';
import 'package:eqdam_final/models/customers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/shared/components/components.dart';
import 'package:url_launcher/link.dart';


class WorksPageScreen extends StatelessWidget {
  const WorksPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CustomersModel customersModel;
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg3.jpg',
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 200,),
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
                        children:
                        [
                          gradientText(
                            text: 'Some Of Our Projects',
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
                          Link(
                            uri: Uri.parse('http://www.eqdam.net'),
                            builder: (context,followLink)
                            {
                              return InkWell(
                                onTap: followLink,
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(24),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/images/ws.jpg'))),
                                ),
                              );
                            },
                            ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8,right: 8,top: 34,bottom: 8),
                            child: Divider(thickness: 2,),
                          ),
                          gradientText(
                            text: 'WE DO IT FOR THEM',
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
                          const Text(
                            'Some of our honourable clients that that we are deeply proud of our partnership with them, that turned out to be more than just  friendship a family, and we are still growing',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Cairo',
                                letterSpacing: .4,
                                height: 1),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 200.0,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                              const Duration(seconds: 3),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                              viewportFraction: .5,
                            ),
                            itemCount:
                            LayoutCubit.get(context).customers.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex,) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                color: Colors.white.withOpacity(.8),
                                child: Image(
                                  height: 25,
                                  image: NetworkImage(LayoutCubit.get(context).customers[index].customerImage!)
                                ),
                              );
                            },
                          ),

                        ],
                      ),
                    ),
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
