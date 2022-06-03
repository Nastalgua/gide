import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Material(
        color: const Color(0xFFF6F6F6),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: height,
              width: width * .844,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Credits',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => creditTab(
                        'Nippon Cha',
                        70,
                        '9/16',
                        height,
                        width
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: 5
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget creditTab(String name, int percent, String date, double height, double width){
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.black,
      primary: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
    ),
    child: Container(
      height: height * .25,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFFFFFF)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.15,
                  width: width * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/noodles.png'),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                )
              ],
            ),
            const SizedBox(width: 10,),
            const DottedLine(
              direction: Axis.vertical,
              dashLength: 3,
              dashColor: Colors.grey,
              dashGapLength: 3,
            ),
            const SizedBox(width: 10,),
            Flexible(
              child: SizedBox(
                height: height * 0.23,
                width: width * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$percent% ',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue
                              ),
                            ),
                            TextSpan(
                              text: 'off',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Expires $date',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Show Credit',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/Arrow 1.svg',
                            height: height * 0.01,
                            width: width * 0.03,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    ),
  );
}
