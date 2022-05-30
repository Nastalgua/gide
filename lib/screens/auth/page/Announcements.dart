import 'package:flutter/material.dart';
import 'package:gide/screens/auth/page/favorites.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: Material(
        color: const Color(0xFFF6F6F6),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: width * 0.95,
                height: height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/nippon_cha.jpg'),//todo: image source from firebase of restaurant
                    fit: BoxFit.fill
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.05 / 2, 15, width * 0.05 / 2, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nippon Cha',//todo: restaurant name from firebase
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.05 / 2, 15, width * 0.05 / 2, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(//todo: restaurant description from firebase
                    "All of our menu items are inspired by _____ cuisine and have been created by our head chef, (CN), after studying authentic _____ cuisine in ____. Not only do we have fresh flown-in seafood from the northeast, but we also have a variety of handcrafted cocktails, wine, and beer to choose from.",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF525252)
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    softWrap: false,
                  ),
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Color(0xFFBFBCBC),
              ),
              Align(
                alignment: Alignment.center,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: CircleTabIndicator(color:Colors.black, radius: 4),
                  tabs: const [
                    Tab(text: 'Announcements'),
                    Tab(text: 'Items')
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: width * 0.9,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: width * 0.1 / 2, right: width * 0.1 / 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFFFFFFF)
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Create announcement here...'
                                ),
                              )
                            )
                          ),
                          const SizedBox(height: 10),
                          ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => announcementTab(//todo: announcement & date of announcement from firebase
                              "All of our menu items are inspired by _____ cuisine and have been created by our head chef, (CN), after studying authentic _____ cuisine in ____. Not only do we have fresh flown-in seafood from the northeast, but we also have a variety of handcrafted cocktails, wine, and beer to choose from.",
                              '5/24/2022',
                              height,
                              width
                            ),
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemCount: 5
                          ),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => itemTab(//todo: item name & description from firebase
                          'shoes',
                          "All of our menu items are inspired by _____ cuisine and have been created by our head chef, (CN), after studying authentic _____ cuisine in ____. Not only do we have fresh flown-in seafood from the northeast, but we also have a variety of handcrafted cocktails, wine, and beer to choose from.",
                          height,
                          width//todo: add a way to pass img src
                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: 5
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget announcementTab(String desc, String date, double height, double width){
  return Container(
    height: height * .14125,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xFFFFFFFF)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: height * .09875,
          width: width,
          padding: EdgeInsets.only(left: width * 0.1 / 2, right: width * 0.1 / 2),
          alignment: Alignment.centerLeft,
          child: Text(
            desc,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF525252)
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            softWrap: false,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: width * 0.1 / 2, right: width * 0.1 / 2),
          alignment: Alignment.centerLeft,
          child: Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFA3A3A3)
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            softWrap: false,
          ),
        )
      ],
    ),
  );
}

Widget itemTab(String name, String desc, double height, double width){
  return Container(
    height: height * .18,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFFFFFF)
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: height * 0.16,
            width: height * 0.16,//width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/noodles.png'),//todo: replace with img src
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(
            height: height * 0.16,
            width: width * 0.55,
            child: Column(
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w800
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF525252)
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  softWrap: false,
                )
              ],
            ),
          )
        ],
      ),
    )
  );
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color:color, radius:radius);
  }

}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});


  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;

    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - 2.5 * radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
