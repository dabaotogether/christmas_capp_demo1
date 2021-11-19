// ignore: file_names
// ignore_for_file: file_names

import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:christmas_capp/screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // assetsAudioPlayer.open(
    //   Audio("audio/JingleBells.mp3"),
    // );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Image _image = Image.asset('images/star.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: animation.value,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // ImageFiltered(
            //   imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            //   child: Image.asset(
            //     "images/xmas_image1.jpg",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/image1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(color: Colors.grey.withOpacity(0.5)),
            AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                  options: ParticleOptions(
                image: _image,
                spawnMinRadius: 4.0,
                spawnMaxRadius: 8.0,
                particleCount: 120,
                baseColor: Colors.white54,
              )),
              vsync: this,
              child: const Text(''),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: AnimatedTextKit(
                        pause: const Duration(milliseconds: 1000),
                        animatedTexts: [
                          FadeAnimatedText(
                            '',
                            duration: const Duration(milliseconds: 500),
                          ),
                          FadeAnimatedText(
                            'Another year is coming to an end,',
                            textAlign: TextAlign.center,
                            duration: const Duration(milliseconds: 4000),
                            textStyle: const TextStyle(
                              fontFamily: "Kalam",
                              color: Colors.black,
                              fontSize: 25,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FadeAnimatedText(
                            'and I just want to say thank you again.',
                            duration: const Duration(milliseconds: 4000),
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(
                              fontFamily: "Kalam",
                              color: Colors.black,
                              fontSize: 25,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        isRepeatingAnimation: false,
                        onFinished: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 1500),
                                  curve: Curves.ease,
                                  type: PageTransitionType.rotate,
                                  alignment: Alignment.topCenter,
                                  child: SecondScreen()));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  // spinkit,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
