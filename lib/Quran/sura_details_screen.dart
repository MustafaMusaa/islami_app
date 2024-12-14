import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Quran/sura_modal.dart';
import 'package:islami_app/color_data.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetailsScreen';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  void loadSuraDetails(int index) async {
    String suraDetails =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraDetailsLines = suraDetails.split('\n');
    ayat = suraDetailsLines;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModal;
    if (ayat.isEmpty) {
      loadSuraDetails(args.suraNumber);
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
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
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.119,
            right: MediaQuery.of(context).size.height * 0.019,
            left: MediaQuery.of(context).size.height * 0.019, ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/detailsScreen_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Text(
              " سورة ${args.suraArName}",
              style: TextStyle(
                  color: ColorData.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Expanded(
              child: ayat.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      color: ColorData.gold,
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          '[${index + 1}] ${ayat[index]}',
                          style: TextStyle(
                              color: ColorData.gold,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          textAlign: TextAlign.right,
                        );
                      },
                      itemCount: ayat.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
