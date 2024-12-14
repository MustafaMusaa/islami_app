import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Hadeth/hadeth_modal.dart';
import 'package:islami_app/Quran/sura_modal.dart';
import 'package:islami_app/color_data.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadethDetailsScreen';

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModal;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorData.gold),
        centerTitle: true,
        title: Text(
          args.title,
          style: TextStyle(
            color: ColorData.gold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: MediaQuery.of(context).size.height*0.01),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/detailsScreen_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              args.title,
              style: TextStyle(
                  color: ColorData.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),

            Expanded(
              child: args.matn.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      color: ColorData.gold,
                    ))
                  : ListView(
                      children: [
                        Text(
                          args.matn.toString(),
                          style: TextStyle(
                              color: ColorData.gold,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
