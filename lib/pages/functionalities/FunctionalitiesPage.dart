import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';

class FunctionalitiesPage extends StatefulWidget {
  const FunctionalitiesPage({super.key});

  @override
  State<FunctionalitiesPage> createState() => _FunctionalitiesPageState();
}

class _FunctionalitiesPageState extends State<FunctionalitiesPage> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isConnected = false;

  Future<void> openWeb() async {
    final Uri url = Uri.parse('google.navigation:q=Orlando FL&mode=d');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> share() async {
    Share.share('Compartilha vai https://pub.dev/packages/share_plus');
  }

  Future<void> getDir() async {
    final Directory? downloadsDir = await PathProvider.getDownloadsDirectory();
    print(downloadsDir?.path);
    "Functionalities";
  }

  Future<void> getAppInfo() async {
    WidgetsFlutterBinding.ensureInitialized();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    String device = Platform.operatingSystem;

    var message =
        "App name: $appName\nPackage name: $packageName\nVersion: $version\nBuild number: $buildNumber\nDevice: $device";

    showAlert(message);
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var message = "";

    switch (Platform.operatingSystem) {
      case "android":
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        message = 'Running on ${androidInfo.model}';
        break;

      case "macos":
      case "ios":
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        message = 'Running on ${iosInfo.utsname.machine}';
        break;

      default:
        WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
        message = 'Running on ${webBrowserInfo.userAgent}';
        break;
    }

    showAlert(message);
  }

  Future<void> getConnectionInfo() async {
    var message = "";

    final connectivityResult = await (Connectivity().checkConnectivity());

    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        message = "Connected to a mobile network";
        break;

      case ConnectivityResult.wifi:
        message = "Connected to a wifi network";
        break;

      case ConnectivityResult.ethernet:
        message = "Connected to a ethernet network";
        break;

      case ConnectivityResult.none:
        message = "Not connected to any network";
        break;

      case ConnectivityResult.vpn:
        message = "Connected to a vpn network";
        break;

      case ConnectivityResult.bluetooth:
        message = "Connected to a bluetooth network";
        break;

      default:
        message = "Connected to a other network";
        break;
    }

    showAlert(message);
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    var message = "";

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    message = (await Geolocator.getCurrentPosition()).toString();

    showAlert(message);
  }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Text(message),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  Future<void> init() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        isConnected = result != ConnectivityResult.none;
      });
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home"), actions: [
          IconButton(onPressed: share, icon: const Icon(Icons.share)),
          IconButton(onPressed: getDir, icon: const Icon(Icons.folder))
        ]),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: getAppInfo,
                    icon: const Icon(Icons.info),
                    label: const Text("Informações do aplicativo")),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                    onPressed: getDeviceInfo,
                    icon: const Icon(Icons.devices),
                    label: const Text("Informações do dispositivo")),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                Text(isConnected == true ? "° Conectado" : "° Desconectado"),
                TextButton.icon(
                    onPressed: getConnectionInfo,
                    icon: const Icon(Icons.network_check),
                    label: const Text("Verificar conexão")),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                    onPressed: getLocation,
                    icon: const Icon(Icons.gps_fixed),
                    label: const Text("Minha localização")),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: openWeb,
          child: const Icon(Icons.map),
        ),
      ),
    );
  }
}
