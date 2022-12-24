import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/massege/component/styles.dart';
import 'package:mcode/screen/admin/massege/component/widgets.dart';
import 'package:mcode/screen/admin/massege/pages/chatpage.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Message',
          style: Styles.h1(),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Container(
                    color: kPrimaryColor,
                    padding: const EdgeInsets.all(8),
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 7.0),
                          child: Text(
                            'Recent Users',
                            style: Styles.h1(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          height: 80,
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return ChatWidgets.circleProfile();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: Styles.friendsBox(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            'Contacts',
                            style: Styles.h1().copyWith(color: Colors.indigo),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: StreamBuilder(
                                stream:
                                    firestore.collection('Rooms').snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  List data = !snapshot.hasData
                                      ? []
                                      : snapshot.data!.docs
                                          .where((element) => element['users']
                                              .toString()
                                              .contains(FirebaseAuth
                                                  .instance.currentUser!.uid))
                                          .toList();
                                  return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      List users = data[index]['users'];
                                      var friend = users.where((element) =>
                                          element !=
                                          FirebaseAuth
                                              .instance.currentUser!.uid);
                                      var user = friend.isNotEmpty
                                          ? friend.first
                                          : users
                                              .where((element) =>
                                                  element ==
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid)
                                              .first;
                                      return FutureBuilder(
                                        future: firestore
                                            .collection('users')
                                            .doc(user)
                                            .get(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          return !snapshot.hasData
                                              ? Container()
                                              : ChatWidgets.card(
                                                  title: snapshot.data!['name'],
                                                  subtitle: data[index]
                                                      ['last_message'],
                                                  time: DateFormat('hh:mm a')
                                                      .format(data[index]
                                                              ['last_time']
                                                          .toDate()),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          print("---------------Success-------------");
                                                          return ChatPage(
                                                            id: user,
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                        },
                                      );
                                    },
                                  );
                                }),
                          ),
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
    );
  }
}
