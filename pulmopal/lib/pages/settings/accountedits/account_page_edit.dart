// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/settings/account_page.dart';
import 'package:pulmopal/pages/settings/controller/profile_controller.dart';

class AccountPageEdit extends ConsumerWidget {
  AccountPageEdit({super.key});

  bool sifre_gozukme = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SafeArea(
        child: FutureBuilder<UserModel>(
            future: ref.read(ProfileControllerProvider).getUser(),
            builder: (context, Snapshot) {
              if (Snapshot.hasData) {
                final UserModel = Snapshot.data!;
                return Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(100.0),
                      child: AppBar(
                        flexibleSpace: Container(
                          height: 200,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                                colors: [Color(0xFF273C4F), Color(0xFF517DA0)]),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 40,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AccountPage(),
                                    )),
                                icon: const Icon(Icons.arrow_back_rounded),
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 105,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/logo.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              IconButton(
                                iconSize: 40,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications,
                                  color: Colors.black,
                                ),
                                //style: const ButtonStyle(iconColor: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    body: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 400,
                            height: 50,
                            margin: const EdgeInsets.all(10),
                            child: const Center(
                              child: Text(
                                'Profile Settings',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 31),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: CachedNetworkImageProvider(
                                UserModel.profilePhoto!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("@${UserModel.username}"),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'BAM',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'TEAM',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'teambam@gmail.com',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  obscureText: sifre_gozukme,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: '*********',
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  sifre_gozukme = !sifre_gozukme;
                                },
                                icon: const Icon(Icons.remove_red_eye,
                                    color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: '20',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Asthma',
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 104, 148, 183),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 300,
                              height: 50,
                              margin: const EdgeInsets.all(10),
                              child: const Center(
                                child: Text(
                                  'Update Account',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 175,
                              height: 50,
                              margin: const EdgeInsets.all(10),
                              child: const Center(
                                child: Text(
                                  'Delete Account',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ));
              } else if (Snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("something went wrong"),
                );
              }
            }),
      ),
    );
  }
}
