import 'package:coffee_roasting_app/bluetooth_connect_page.dart';
import 'package:coffee_roasting_app/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 54, 66),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomePageIcon(),
              HomePageButton(
                btnText: 'Connect a Device',
                btnIcon: Icons.bluetooth,
                btnLocation: BluetoothConnectPage(),
              ),
              HomePageButton(
                btnText: 'Roast History',
                btnIcon: Icons.list,
                btnLocation: StatsPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageIcon extends StatelessWidget {
  const HomePageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   border: Border.all(
      //     width: 2,
      //     color: const Color.fromARGB(255, 252, 68, 15),
      //   ),
      // ),
      alignment: Alignment.center,
      child: Expanded(
        child: Text(
          'CafeConnect',
          style: GoogleFonts.dancingScript(
            shadows: [
              const Shadow(
                color: Color.fromARGB(255, 252, 68, 15),
                offset: Offset(2, 2),
              ),
            ],
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w900,
            letterSpacing: 5,
          ),
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    super.key,
    required this.btnText,
    required this.btnIcon,
    required this.btnLocation,
  });

  final String btnText;
  final IconData btnIcon;
  final Widget btnLocation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => btnLocation),
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 5, 142, 217),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                btnIcon,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                btnText,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
