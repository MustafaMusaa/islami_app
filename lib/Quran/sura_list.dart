import 'package:flutter/material.dart';
import 'package:islami_app/Quran/sura_modal.dart';
import '../color_data.dart';

class SuraList extends StatelessWidget {
  SuraModal suraModal;


  SuraList({
    required this.suraModal
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(image: AssetImage('assets/images/Vector.png')),
              Text(
                '${suraModal.suraNumber+1}',
                style: TextStyle(color: ColorData.white),
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${suraModal.suraEnName}',
                style: TextStyle(
                    color: ColorData.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${suraModal.numberOfAyat} verses',
                style: TextStyle(
                    color: ColorData.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Text(
            '${suraModal.suraArName}',
            style: TextStyle(
                color: ColorData.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
