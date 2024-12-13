class HadethModal {
  String title ;
  List<String> matn ;
  HadethModal({required this.title , required this.matn});
}


// CarouselSlider(
// items: [1, 2, 3, 4, 5].map((i) {
// return Builder(
// builder: (BuildContext context) {
// Container(
// width: MediaQuery.of(context).size.width,
// padding: EdgeInsets.all(10),
// margin: EdgeInsets.symmetric(horizontal: 5.0),
// decoration: BoxDecoration(
// image: DecorationImage(
// image:
// AssetImage('assets/images/hadethCard_bg.png'),
// fit: BoxFit.fill,
// ),
// borderRadius: BorderRadius.circular(30),
// color: ColorData.gold),
// child: Text(
// 'text $i',
// style: TextStyle(fontSize: 16.0),
// ));
// },
// );
// }).toList(),
// )