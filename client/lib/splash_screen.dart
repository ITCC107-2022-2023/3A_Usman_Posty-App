import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './screens/login.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    // _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 100), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#4A5568'),
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: Padding(
          padding: const EdgeInsets.all(150), // set the desired padding here
          // child: Image.asset(
          //   'assets/images/logo.png',
          //   width: 80,
          //   height: 80,
          // ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: SvgPicture.asset(
                  'assets/svg/splash_screen.svg',
                  width: 275,
                  height: 250,
                ),
              ),
              Text(
                'Find New Friends',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'With Posty App',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 300, // set the desired width here
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20), // set the desired padding here
                  child: Column(
                    children: [
                      Text(
                        'With Posty App then you will find new friends from various country and regions throughout the region.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: HexColor('#ECEFF1'),
                        ),
                      ),
                      const SizedBox(
                          height:
                              20), // add some space between the text and the button
                      ElevatedButton(
                        onPressed: () {
                          _navigatetohome();
                        }, // add your desired functionality here
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor('#ECEFF1'),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor(
                              '#1976D2'), // set the background color of the button
                          padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 100), // set the padding of the button
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), // set the border radius of the button
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
