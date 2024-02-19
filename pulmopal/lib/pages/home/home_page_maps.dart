import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pulmopal/widgets/app_bar.dart';
import 'package:pulmopal/widgets/bottom_bar.dart';

class HomePageMaps extends StatelessWidget {
  const HomePageMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "google maps",
      home: HomePageMapsForm(),
    );
  }
}

class HomePageMapsForm extends StatefulWidget {
  const HomePageMapsForm({super.key});

  @override
  State<HomePageMapsForm> createState() => _HomePageMapsFormState();
}

class _HomePageMapsFormState extends State<HomePageMapsForm> {
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
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _searchContoller,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(hintText: 'Search'),
                  onChanged: (value) {},
                )),
                IconButton(
                    onPressed: () {},
                    /*() async {
                      var place = await LocationServices()
                          .getPlace(_searchContoller.text);
                      goToPlace(place);
                    },*/
                    icon: const Icon(Icons.search))
              ],
            ),
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: const GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: true,
                liteModeEnabled: true,
              ),
            ),
          ],
        ),
        /*floatingActionButton: FloatingActionButton.extended(
          onPressed: goToTheLake,
          label: const Text("to the lake"),
          icon: const Icon(Icons.directions_boat),
        ),*/
      ),
    );
  }

  Future<void> goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
  }

  Future<void> goToTheLake() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
