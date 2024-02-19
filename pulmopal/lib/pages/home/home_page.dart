// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pulmopal/widgets/app_bar.dart';
import 'package:pulmopal/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeForm(),
    );
  }
}

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _searchContoller = TextEditingController();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(40.984760, 29.138325), zoom: 14);

  static const CameraPosition _kLake = CameraPosition(
    target: LatLng(40.984760, 29.138325),
    bearing: 192.833,
    tilt: 59.940,
    zoom: 19.15,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bottomBar(context),
      appBar: appBar(),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Column(
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFB3B3B3)),
                child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(
                  Icons.search,
                  size: 40,
                ))),
              ),
              const SizedBox(height: 10),
              Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                    image: AssetImage('assets/harita.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 5),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [Colors.green, Colors.red])),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' TEMPERATURE:', style: TextStyle(fontSize: 25)),
                    Text('8  ',
                        style: TextStyle(fontSize: 50, color: Colors.white60)),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [Colors.green, Colors.red])),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' NO2:', style: TextStyle(fontSize: 25)),
                    Text('59  ',
                        style: TextStyle(fontSize: 50, color: Colors.white60)),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [Colors.green, Colors.red])),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' AQI:', style: TextStyle(fontSize: 25)),
                    Text('78  ',
                        style: TextStyle(fontSize: 50, color: Colors.white60)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF7D0A0A), Color(0xFFBF3131)]),
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        const Icon(Icons.warning),
                        Container(
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ' This is not a safe zone for your       health. Please leave.',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    ));
  }
}
