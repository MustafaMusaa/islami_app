import 'package:flutter/material.dart';
import 'package:islami_app/Quran/sura_modal.dart';
import 'package:islami_app/color_data.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'suraDetailsScreen';

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModal;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorData.gold),
        centerTitle: true,
        title: Text(
         args.suraEnName,
          style: TextStyle(
            color: ColorData.gold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/detailsScreen_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              args.suraArName,
              style: TextStyle(
                color: ColorData.gold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
