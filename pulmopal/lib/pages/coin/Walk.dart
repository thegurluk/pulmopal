// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:pulmopal/widgets/app_bar.dart';

class Walk extends StatefulWidget {
  const Walk({Key? key}) : super(key: key);

  @override
  _WalkState createState() => _WalkState();
}

class _WalkState extends State<Walk> {
  late Timer _timer; // Zamanlayıcı değişkeni
  int _remainingTime = 3600; // Başlangıçta 1 saat (3600 saniye)
  bool _isTimerActive =
      false; // Zamanlayıcının aktif olup olmadığını belirten değişken

  // Zamanlayıcıyı başlatan fonksiyon
  void startTimer() {
    setState(() {
      _isTimerActive = true;
      _remainingTime = 3600; // 1 saatlik geri sayımı yeniden başlat
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          _isTimerActive = false;
        }
      });
    });
  }

  // Zamanlayıcıyı durduran fonksiyon
  void stopTimer() {
    if (_isTimerActive) {
      _timer.cancel();
      setState(() {
        _isTimerActive = false;
      });
    }
  }

  @override
  void dispose() {
    if (_isTimerActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 0, 255, 170),
                  ),
                  value:
                      1 - (_remainingTime / 3600), // Saat başına yüzdeyi ayarla
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/walk.png',
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
              // Geri sayacı dairenin içine yerleştir
              Positioned(
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    if (_isTimerActive) {
                      stopTimer();
                    } else {
                      startTimer();
                    }
                  },
                  child: Text(
                    '${(_remainingTime ~/ 3600).toString().padLeft(2, '0')}:${((_remainingTime % 3600) ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Column ile arasındaki boşluk
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Zamanlayıcıyı başlat
                  startTimer();
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 74, 115, 147),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Walk',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Zamanlayıcıyı durdur
                  stopTimer();
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 74, 115, 147),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Stop',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Zamanlayıcıyı devam ettir veya başlat
                  if (!_isTimerActive) {
                    startTimer();
                  }
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 74, 115, 147),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
