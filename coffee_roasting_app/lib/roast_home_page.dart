import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoastHomePage extends StatefulWidget {
  const RoastHomePage({super.key});

  @override
  State<RoastHomePage> createState() => _RoastHomePageState();
}

class _RoastHomePageState extends State<RoastHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 20, 54, 66),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 50,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          const Shadow(
                            color: Color.fromARGB(255, 252, 68, 15),
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InfoCard('Soak Temp.', '150\u2109'),
                    InfoCard('Soak Time', '20 mins.'),
                  ],
                ),
              ),
              const Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InfoCard('Final Temp.', '200\u2109'),
                    InfoCard('Ramp Speed', '0.6 m/s'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FloatingActionButton.extended(
                        onPressed: null,
                        label: Text(
                          'Notes',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.notes),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText(this.textContent, {super.key});

  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(this.cardTopText, this.cardBottomText, {super.key});

  final String cardTopText;
  final String cardBottomText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Color.fromARGB(255, 5, 142, 217),
            //     offset: Offset(2, 2),
            //   ),
            // ],
            ),
        child: Card(
          color: const Color.fromARGB(255, 59, 72, 77),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    cardTopText,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    cardBottomText,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      shadows: [
                        const Shadow(
                          color: Color.fromARGB(255, 252, 68, 15),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
