import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class BluetoothConnectPage extends StatefulWidget {
  const BluetoothConnectPage({super.key});

  @override
  State<BluetoothConnectPage> createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  List<ScanResult> deviceList = [];
  bool isScanning = false;

  scanDevices() async {
    setState(() {
      isScanning = true;
    });
    await flutterBlue.startScan(timeout: const Duration(seconds: 2));

    flutterBlue.scanResults.listen((results) {
      deviceList = results;
    });

    flutterBlue.stopScan();

    setState(() {
      isScanning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    scanDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 68, 15),
        actions: [
          TextButton(
            onPressed: scanDevices,
            child: Text(
              'Scan',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
        title: Text(
          'Bluetooth Devices',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 54, 66),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isScanning) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
