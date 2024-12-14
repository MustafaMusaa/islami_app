import 'package:flutter/material.dart';
import 'package:islami_app/Quran/sura_details_screen.dart';
import 'package:islami_app/Quran/sura_list.dart';
import 'package:islami_app/Quran/sura_modal.dart';

import '../color_data.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/quran_bg.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.14,),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: ColorData.gold)),
                  fillColor: ColorData.lightBlack,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorData.gold),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: ColorData.gold, style: BorderStyle.solid),
                  ),
                  hintText: "Sura Name",
                  hintStyle: const TextStyle(
                    color: ColorData.white,
                  ),
                  prefixIcon: const ImageIcon(
                    AssetImage('assets/images/quran_icon.png'),
                    color: ColorData.gold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              const Text(
                'Most Recently',
                style: TextStyle(color: ColorData.white),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: ColorData.gold,
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SuraEnName',
                            style: TextStyle(
                                color: ColorData.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'SuraArName',
                            style: TextStyle(
                                color: ColorData.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'NumOfVerses',
                            style: TextStyle(
                                color: ColorData.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                   Spacer(),
                    Image(
                        image:
                            AssetImage('assets/images/sura_recent_image.png'))
                  ],
                ),
              ),
              const Text(
                'Sura List',
                style: TextStyle(color: ColorData.white),
              ),
              Expanded(
                  child: ListView.builder(
                                  itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                          arguments:
                          SuraModal(
                              suraNumber: index,
                              numberOfAyat: SuraModal.numberOfAya[index],
                              suraEnName: SuraModal.englishSurahName[index],
                              suraArName: SuraModal.arabicSuraName[index])
                      );
                    },
                    child: Column(
                      children: [
                        SuraList(
                         suraModal: SuraModal(
                             suraNumber: index,
                             numberOfAyat: SuraModal.numberOfAya[index],
                             suraEnName: SuraModal.englishSurahName[index],
                             suraArName: SuraModal.arabicSuraName[index]),
                        ),
                        const Divider(
                          color: ColorData.white,
                          thickness: 2,
                          endIndent: 50,
                          indent: 50,
                        )
                      ],
                    ),
                  );
                                  },
                                  itemCount: SuraModal.arabicSuraName.length,
                                ))
            ],
          ),
        ),
      ),
    );
  }
}
