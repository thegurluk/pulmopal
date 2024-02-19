import 'package:flutter/material.dart';
import 'package:pulmopal/widgets/app_bar.dart';
import 'package:pulmopal/widgets/bottom_bar.dart';
import 'WaterPage.dart';
import 'Breath.dart';
import 'Walk.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int pcCount = 0; // Sayaç değişkeni
  static const int maxPcCount = 20; // Maksimum PC sayısı
  bool waterPageVisited = false;
  bool walkPageVisited = false;
  bool breathPageVisited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200, //
                  width: 200,
                  child: CircularProgressIndicator(
                    value: pcCount / maxPcCount,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 0, 255, 170),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/dollar-symbol.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$pcCount',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20), // Column ile arasındaki boşluk
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WaterPage()), // WaterPage'e git
                    ).then((_) {
                      setState(() {
                        waterPageVisited = true;
                      });
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 74, 115, 147),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Drink Water',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: waterPageVisited
                      ? () {
                          setState(() {
                            pcCount++;
                          });
                        }
                      : null,
                  child: Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: waterPageVisited
                          ? const Color.fromARGB(255, 74, 115, 147)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Click',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Walk()), // Walk Page'e git
                    ).then((_) {
                      setState(() {
                        walkPageVisited = true;
                      });
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 74, 115, 147),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Walk',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: walkPageVisited
                      ? () {
                          setState(() {
                            pcCount++;
                          });
                        }
                      : null,
                  child: Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: walkPageVisited
                          ? const Color.fromARGB(255, 74, 115, 147)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Click',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Breath()), // Breath Page'e git
                    ).then((_) {
                      setState(() {
                        breathPageVisited = true;
                      });
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 74, 115, 147),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Breathing Exercise',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: breathPageVisited
                      ? () {
                          setState(() {
                            pcCount++;
                          });
                        }
                      : null,
                  child: Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: breathPageVisited
                          ? const Color.fromARGB(255, 74, 115, 147)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Click',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: bottomBar(context));
  }
}
