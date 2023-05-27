import 'package:flutter/material.dart';

class BluetoothConnectPage extends StatefulWidget {
  const BluetoothConnectPage({super.key});

  @override
  State<BluetoothConnectPage> createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 54, 66),
        ),
        child: const Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
