import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Hadeth/hadeth_details_screen.dart';
import 'package:islami_app/Hadeth/hadeth_modal.dart';
import 'package:islami_app/color_data.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModal> hadethMatnList = [];

  void loadHadethMatn() async {

    for (int i = 1; i <= 50; i++) {
      String hadethMatn = await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethMatn.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModal hadethModal = HadethModal(title: title, matn: hadethLines);
      hadethMatnList.add(hadethModal);

    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    if(hadethMatnList.isEmpty) {
      loadHadethMatn();

    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/hadeth_bg.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.11,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height*.68,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 0,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
              itemCount: hadethMatnList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
                              arguments:
                              hadethMatnList[itemIndex]

                          );
                        },
                        child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                        image: AssetImage('assets/images/hadethCard_bg.png'),
                        fit: BoxFit.fill,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                            color: ColorData.gold),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                        SizedBox(height: 20,),
                        Text(
                          hadethMatnList[itemIndex].title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                            child: Text(
                           hadethMatnList[itemIndex].matn.join(''),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.09,
                        )
                                            ],
                                          ),
                                        ),
                                      ),
                      ),
            )
          ],
        ),
      ),
    );
  }
}
