// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eqdam_final/shared/style/icons/eqdam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: ( context, state){},
      builder: ( context, state)
      {
        var cubit = LayoutCubit.get(context);
        return Scaffold(

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image(height: 25,image: AssetImage('assets/images/home.png'),),
                icon: Icon(
                  Eqdam.home,
                  color: Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Image(height: 25,image: AssetImage('assets/images/about us.png'),),
                icon: Icon(
                  Eqdam.aboutUs,
                  color: Colors.grey,
                ),
                label: 'About US',
              ),
              BottomNavigationBarItem(
                activeIcon: Image(height: 25,image: AssetImage('assets/images/works.png'),),
                icon: Icon(
                  Eqdam.works,
                  color: Colors.grey,
                ),
                label: 'Our Works',
              ),
              BottomNavigationBarItem(
                activeIcon: Image(height: 25,image: AssetImage('assets/images/contact.png'),),
                icon: Icon(
                  Eqdam.contact,
                  color: Colors.grey,
                ),
                label: 'Contact us',
              ),
            ],
          ),
        );
      },
    );
  }
}
