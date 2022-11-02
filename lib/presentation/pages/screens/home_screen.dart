import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/style/colors.dart';
import '../../routers/rout_names.dart';
import '../../widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldState> homeKey = GlobalKey();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final CarouselController _controller = CarouselController();
  String? image = '';
  final List<String> imgList = [
    'assets/images/intro_first_image.png',
    'assets/images/intro_second_image.png',
    'assets/images/language_logo.png',
  ];
  List<Widget> imageWidgetList = [];
  final box = GetStorage();
  @override
  void initState() {
    imageWidgetList.add(
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imgList[0]),
              fit: BoxFit.cover,
            )),
      ),
    );
    imageWidgetList.add(
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imgList[1]),
              fit: BoxFit.cover,
            )),
      ),
    );
    imageWidgetList.add(
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imgList[2]),
              fit: BoxFit.cover,
            )),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeScreen.homeKey,
      appBar: StaticAppBar.homeAppBar(context, 'Home', true, ''),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 130,
              color: blueColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: whiteColor,
                                  ),
                                  child: (image == '')
                                      ? const Center(
                                          child: Icon(
                                            Icons.person,
                                            color: blueColor,
                                            size: 26,
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(image!),
                                        ),
                                ),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'User name',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '+1 234 343341',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'SF Pro Display',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            drawerButton('', 'assets/icons/premium.svg', 'Subscription plan'),
            drawerButton('', 'assets/icons/cart.svg', 'Payments'),
            drawerButton('', 'assets/icons/sync.svg', 'Pending invitations'),
            drawerButton('', 'assets/icons/notfication_sv.svg', 'Notification settings'),
            drawerButton('', 'assets/icons/faq_sv.svg', 'FAQ'),
            drawerButton('', 'assets/icons/mission_sv.svg', 'Mission statement'),
            // drawerButton('', 'assets/icons/socail.svg', 'Social media'),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: logOutButton('', 'assets/icons/logout.svg', 'Log out'),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
                  child: SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      items: imageWidgetList,
                      carouselController: _controller,
                      options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: false,
                          enlargeCenterPage: false,
                          aspectRatio: 0.1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : blueColor)
                                  .withOpacity(current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, agenda);
                        },
                        child: SizedBox(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: AssetImage('assets/icons/Agenda.png'),
                                    )),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Agenda',
                                  style: TextStyle(
                                    color: blackTextColor,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: AssetImage('assets/icons/calendar.png'),
                                    )),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Calendar',
                                  style: TextStyle(
                                    color: blackTextColor,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(journal);
                        },
                        child: SizedBox(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: AssetImage('assets/icons/Journal.png'),
                                    )),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Journal',
                                  style: TextStyle(
                                    color: blackTextColor,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/ZingPhotography.png'),
                                    )),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Zing Photography',
                                  style: TextStyle(
                                    color: blackTextColor,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, worldChangers);
                        },
                        child: SizedBox(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/wordl_changer.png'),
                                    )),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'World Changers',
                                  style: TextStyle(
                                    color: blackTextColor,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: AssetImage('assets/icons/Chat.png'),
                                    )),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Chat',
                                  style: TextStyle(
                                    color: blackTextColor,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage('assets/icons/fb.png'),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage('assets/icons/ins.png'),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage('assets/icons/twit.png'),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage('assets/icons/lin.png'),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage('assets/icons/tiktok.png'),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage('assets/icons/snp.png'),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  drawerButton(String route, String svg, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: greyButton,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SvgPicture.asset(
                    svg,
                    color: blackTextColor,
                    width: 16,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: blackTextColor,
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  logOutButton(String route, String svg, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
      child: GestureDetector(
        onTap: () {
          box.remove('token');
          Get.offAllNamed(login);
        },
        child: Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: greyButton,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SvgPicture.asset(
                    svg,
                    color: Colors.red,
                    width: 16,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
