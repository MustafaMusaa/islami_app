import 'package:flutter/material.dart';
import '../color_data.dart';

class SuraList extends StatelessWidget {
  String suraNumber;
  String ayaNumbers;
  String suraEnName;
  String suraArName;

  SuraList({
    required this.suraNumber,
    required this.ayaNumbers,
    required this.suraEnName,
    required this.suraArName,
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
                '${suraNumber}',
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
                '$suraEnName',
                style: TextStyle(
                    color: ColorData.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$ayaNumbers',
                style: TextStyle(
                    color: ColorData.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Text(
            '$suraArName',
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
