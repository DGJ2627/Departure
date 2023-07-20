import 'package:bhavishya_puran_departure/Model/theme_provider.dart';
import 'package:bhavishya_puran_departure/Provider/theme_model.dart';
import 'package:bhavishya_puran_departure/views/screens/detail_page.dart';
import 'package:bhavishya_puran_departure/views/screens/homepage.dart';
import 'package:bhavishya_puran_departure/views/screens/intro_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/Global_variable.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences perf = await SharedPreferences.getInstance();
  iscompleted_intro = perf.getBool("intro_completed") ?? false;
  iscompleted_theme = perf.getBool("theme_completed") ?? false;
  runApp(const Gautam());
}

class Gautam extends StatefulWidget {
  const Gautam({super.key});

  @override
  State<Gautam> createState() => _GautamState();
}

class _GautamState extends State<Gautam> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => theme_provider(
            app_theme: theme_model(isDark: false),
          ),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          colorScheme: ColorScheme.light(
            primary: const Color(0xff37474f),
            secondary: Colors.grey.shade200,
          ),
        ),
        darkTheme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          colorScheme: const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: Colors.deepPurpleAccent,
            secondary: Colors.white54,
          ),
        ),
        themeMode: (Provider.of<theme_provider>(context).app_theme.isDark
            ? ThemeMode.light
            : ThemeMode.dark),
        routes: {
          '/': (context) => const intro_screens(),
          'homepage': (context) => const homepage(),
          'intro_screens': (context) => const intro_screens(),
          'detail_page': (context) => const detali_page(),
        },
      ),
    );
  }
}
