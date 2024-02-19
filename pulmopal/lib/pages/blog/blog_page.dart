// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/blog/blogeWrite/add_write.dart';
import 'package:pulmopal/pages/settings/accountedits/controller/more_controller.dart';
import 'package:pulmopal/widgets/app_bar.dart';
import 'package:pulmopal/widgets/bottom_bar.dart';

class BlogPage extends ConsumerWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: ref.read(MoreControllerProvider).getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final UserModel currentUser = snapshot.data!;
            return SafeArea(
              child: Scaffold(
                bottomNavigationBar: bottomBar(context),
                appBar: appBar(),
                body: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('Samantha Johnson'),
                                    Text('05.22'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'Have you heard of sarcoidosis? It s a disease that forms small nodules in the body and typically affects the lungs.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('Benjamin Parker'),
                                    Text('05.50'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'Another one is eosinophilic pneumonia. It s a rare condition characterized by an accumulation of white blood cells in the lungs.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog2.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('Emily Smith'),
                                    Text('07.24'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'Pleural effusion is also an intriguing condition. It involves the accumulation of fluid outside the lungs.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog3.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('Alexander Brown'),
                                    Text('08.00'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'lung abscesses are also quite fascinating. They are pockets of pus that form in the lung tissue due to infection and decay.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog4.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('Olivia Taylor'),
                                    Text('12.46'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'Bronchiectasis:A chronic condition characterized by the widening and thickening of the airways in the lungs, often leading to recurrent respiratory infections and a persistent cough.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog5.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('Liam Thompson'),
                                    Text('14.31'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'Pulmonary Hypertension: High blood pressure in the arteries of the lungs, which can lead to shortness of breath, dizziness, and fainting, among other symptoms.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog6.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.account_circle_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text('Isabella Martinez'),
                                      Text('15.13'),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: const Text(
                                      'Obstructive Sleep Apnea: A sleep disorder characterized by repeated pauses in breathing during sleep due to blocked or narrowed airways, often resulting in daytime fatigue and other health problems.'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 200,
                                  width: 360,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/blog7.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 352,
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text('William Clark'),
                                    Text('18.51'),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: const Text(
                                    'Cystic Fibrosis: A genetic disorder that causes thick, sticky mucus to build up in the lungs and digestive system, leading to respiratory infections and difficulty breathing.'),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 360,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/blog8.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WriteArticle(currentUser: currentUser),
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
