
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class intro_screens extends StatefulWidget {
  const intro_screens({super.key});

  @override
  State<intro_screens> createState() => _intro_screensState();
}

class _intro_screensState extends State<intro_screens> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(

              // image: Image.network("https://www.youtube.com/watch?v=7JWk8S4OjK0"),
              image: Image.network(
                  "https://i.pinimg.com/736x/62/6a/88/626a88d8caa2884c914983280ebb8b82.jpg",
                  height: 500),
              title:
                  "यदा यदा हि धर्मस्य ग्लानिर्भवति भारत। अभ्युत्थानमधर्मस्य तदात्मानं सृजाम्यहम् ॥"
                  "     ॥ परित्राणाय साधूनां विनाशाय च दुष्कृताम् धर्मसंस्थापनार्थाय सम्भवामि युगे युगे ",
              body:""
                   "मै प्रकट होता हूं, मैं आता हूं, जब जब धर्म की हानि होती है, तब तब मैं आता हूं, जब जब अधर्म बढता है तब तब मैं आता हूं, सज्जन लोगों की रक्षा के लिए मै आता हूं, दुष्टों के विनाश करने के लिए मैं आता हूं, धर्म की स्थापना के लिए में आता हूं और युग युग में जन्म लेता हूं।"
          ),
        ],
        showBackButton: true,
        showNextButton: false,
        back: const Icon(CupertinoIcons.back),
        overrideNext: const Text(""),
        done: const Text("Done"),
        onDone: () async {
          Navigator.of(context).pushNamed('homepage');
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool("intro_completed", true);
        },
      ),
    );
  }
}
