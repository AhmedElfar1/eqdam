import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:eqdam_final/layout/cubit/cubit.dart';
import 'package:eqdam_final/layout/cubit/states.dart';
import 'package:eqdam_final/models/message_model.dart';
import 'package:eqdam_final/models/social_user_model.dart';

class ChatDetailsScreen extends StatefulWidget {
  UserModel? userModel;

  ChatDetailsScreen({Key? key,
    this.userModel,
  }) : super(key: key);

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}
bool? click;
class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  var messageController = TextEditingController();
  ScrollController listScrollController = ScrollController();



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {

        return BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {
          },
          builder: (context, state) {

            LayoutCubit.get(context).getMessages(receiverId: 'Eqdam');
            UserModel? userModel2 = LayoutCubit.get(context).userModel2;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: HexColor('ad71b2'),
                toolbarHeight: 70,
                titleSpacing: 0.0,
                title: Row(
                  children: const [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage:AssetImage('assets/images/logo2.jpg'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Eqdam'),
                  ],
                ),
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/bg5.jpg',
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        controller:listScrollController,
                        itemBuilder: (context, index) {
                          var message =
                          LayoutCubit.get(context).messages[index];
                          if (LayoutCubit.get(context).userModel!.uId ==
                              message.senderId) {
                            return buildMyMessage(message);
                          } else {
                            return buildMessage(message);
                          }
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: LayoutCubit.get(context).messages.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(color: HexColor('948cc3')),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: TextFormField(
                                  decoration:const InputDecoration(),
                                  controller: messageController,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: MaterialButton(
                              onPressed: () {
                                if (listScrollController.hasClients) {
                                  final position = listScrollController.position.maxScrollExtent;
                                  listScrollController.animateTo(
                                    position,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                  );
                                }
                                LayoutCubit.get(context).sendFCMNotification(
                                  token: userModel2!.token,
                                  senderName: LayoutCubit.get(context).userModel!.name,
                                  messageText: messageController.text,
                                );
                                LayoutCubit.get(context).sendMessage(
                                  receiverId: "Eqdam",
                                  dateTime: DateTime.now().toString(),
                                  text: messageController.text,
                                );
                                messageController.clear();
                              },
                              child: const Image(
                                image: AssetImage('assets/images/send.png'),
                              ),
                              minWidth: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10),
                  topStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                )),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Text(
              '${model.text}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      );

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            top: 2,
          ),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: HexColor('ad71b2'),
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10),
                  topStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                )),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Text(
              '${model.text}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      );
}
