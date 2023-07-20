import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Model/data_model.dart';
import '../../Model/theme_provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bhavishya Purana"),
        actions: [
          Switch(
              value: Provider.of<theme_provider>(context).app_theme.isDark,
              onChanged: (val) {
                Provider.of<theme_provider>(context, listen: false)
                    .change_app_theme(val);
              }),
        ],
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/Json/my_data.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decodedData = jsonDecode(data);
            List Shlok = decodedData['data'];

            List<Geeta> GeetaData =
                Shlok.map((e) => Geeta.formMap(data: e)).toList();

            return ListView.builder(
                itemCount: GeetaData.length,
                itemBuilder: (context, i) => Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('detail_page',
                                  arguments: GeetaData[i]);
                            },
                            child: Container(
                              height: 800,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/krishna.jpg"),
                                    fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  GeetaData[i].san,
                                  style:  TextStyle(
                                    fontSize: 22,
                                    backgroundColor:
                                        (Provider.of<theme_provider>(context)
                                                .app_theme
                                                .isDark
                                            ? Colors.white
                                            : Colors.black),
                                    fontWeight: (Provider.of<theme_provider>(context)
                                        .app_theme
                                        .isDark
                                        ? FontWeight.w500
                                        : FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ));
          } else if (snapshot.hasError) {}
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
