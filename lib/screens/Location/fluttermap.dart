/*import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:petopia/constant/AppColor.dart';
class MyFlutterMap extends StatelessWidget{
  const MyFlutterMap({super.key});

@override
Widget build(BuildContext context) {
  final MapController _mapController = MapController();
  LatLng? _selectedLocation;
  return Scaffold(
    appBar: AppBar(
      title: Text('Select Location'),
    ),
    body: FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(33.5138, 36.2765),
        initialZoom: 9.2,
        onTap: (tapPosition, point) {
         /* setState(() {
            _selectedLocation = point;
          });*/
          print('Selected Location: ${point.latitude}, ${point.longitude}');
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers:[
            Marker(
              point: _selectedLocation!,
              width: 60,
              height: 60,
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.location_pin,
                size: 60,
                color: AppColor.myblue,
              ),
            )
          ]

        ),
      ],
    ),
        /*RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              //onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),*/


    floatingActionButton: _selectedLocation != null
        ? FloatingActionButton(

      onPressed: () {
        // قم بتنفيذ أي عملية مع إحداثيات الموقع المحدد
        print('Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}');
      },
      child: Icon(Icons.check,size: 80,),
    )
        : null,

  );
}}*/
/*import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:petopia/constant/AppColor.dart';

class MyFlutterMap extends StatefulWidget {
  const MyFlutterMap({super.key});

  @override
  _MyFlutterMapState createState() => _MyFlutterMapState();
}

class _MyFlutterMapState extends State<MyFlutterMap> {
  final MapController _mapController = MapController();
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(33.5138, 36.2765),
          initialZoom: 9.2,
          onTap: (tapPosition, point) {
            setState(() {
              _selectedLocation = point;
            });
            print('Selected Location: ${point.latitude}, ${point.longitude}');
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          if (_selectedLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: _selectedLocation!,
                  width: 60,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.location_pin,
                    size: 60,
                    color: AppColor.myblue,
                  ),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedLocation != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}',
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('No location selected'),
              ),
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:petopia/constant/AppColor.dart';
class MyFlutterMap extends StatelessWidget{
  const MyFlutterMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(33.5138, 36.2765),
          initialZoom: 9.2,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: [
            Marker(point: LatLng(33.5138, 36.2765),
                width: 60,
                height: 60,
                alignment: Alignment.centerLeft,
                child: Icon(Icons.location_pin,size: 60,color: AppColor.myblue,)
            )
          ])
          /*RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              //onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),*/
        ],
      ),
    );
  }}*/
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:petopia/constant/AppColor.dart';
import 'package:petopia/screens/register/register_market/marketregister.dart';
import 'package:petopia/screens/register/register_vet/register_vet.dart';

import '../register/cubit/cubit.dart';

class MyFlutterMap extends StatefulWidget {
  const MyFlutterMap({super.key});

  @override
  _MyFlutterMapState createState() => _MyFlutterMapState();
}

class _MyFlutterMapState extends State<MyFlutterMap> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(33.5138, 36.2765),
          initialZoom: 9.2,
          onTap: (tapPosition, point) {
            setState(() {
              selectedLocation = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: selectedLocation != null
                ? [
              Marker(
                point: selectedLocation!,
                width: 60,
                height: 60,
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.location_pin,
                  size: 60,
                  color: AppColor.myblue,
                ),
              )
            ]
                : [],
          ),
        ],
      ),
      floatingActionButton: selectedLocation != null
          ? FloatingActionButton(
        onPressed: () {
          _showConfirmationDialog(context);
          // قم بتنفيذ أي عملية مع إحداثيات الموقع المحدد
          print('Selected Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}');
        },
        child: Icon(Icons.check),
      )
          : null,
    );
  }
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Location'),
          content: Text(
              'Selected Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}'),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            /*TextButton(
              onPressed: () {

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VetRegisterScreen(),
                    settings: RouteSettings(arguments: {
                      'latitude': selectedLocation!.latitude,
                      'longitude': selectedLocation!.longitude
                    }),
                  ),
                );
                // قم بتنفيذ أي عملية مع إحداثيات الموقع المحدد
                print('Confirmed Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}');
               // Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Confirm', style: TextStyle(color: AppColor.myblue)),
            ),*/
            TextButton(
              onPressed: () {
                //................role...........
               // var role = PetRegisterCubit.get(context).role;
               // if (role == 'doctor') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VetRegisterScreen(),
                      settings: RouteSettings(arguments: {
                        'latitude': selectedLocation!.latitude,
                        'longitude': selectedLocation!.longitude
                      }),
                    ),
                  );
                //} //else if (role == 'market') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MarketRegister(),
                      settings: RouteSettings(arguments: {
                        'latitude': selectedLocation!.latitude,
                        'longitude': selectedLocation!.longitude
                      }),
                    ),
                  );
                //}
                // قم بتنفيذ أي عملية مع إحداثيات الموقع المحدد
                print('Confirmed Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}');
                // Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Confirm', style: TextStyle(color: AppColor.myblue)),
            )
          ],
        );
      },
    );
  }
}
// my_flutter_map.dart



