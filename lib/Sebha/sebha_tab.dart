import 'package:flutter/material.dart';
import 'package:islami_app/color_data.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;
  double turns = 0.0;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('assets/images/sebha_bg.png'),
              fit: BoxFit.cover)),
      child: InkWell(
        autofocus: false,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() => turns += 1 / 33);
          _counter++;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }
          ;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }
          ;
          if (index == azkar.length) {
            index = 0;
          }
          ;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: ColorData.white),
              ),
              SizedBox(height: 20,),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          azkar[index],
                          style: TextStyle(
                              color: ColorData.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$_counter',
                          style: TextStyle(
                              color: ColorData.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    AnimatedRotation(
                        turns: turns,
                        duration: Duration(milliseconds: 50),
                        child: Image.asset(
                          'assets/images/SebhaBody.png',
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
