import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Material(
        color:const Color(0xFFF6F6F6),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: width * 0.8,
              child: Column(
                children: [
                  iconHeader(
                    height, 
                    width, 
                    'Account', 
                    'Edit and manage your account details', 
                    'assets/icons/profile/settings.svg'
                  ),
                  profileBox(
                    height, 
                    width, 
                    'hi', 
                    'hi', 
                    '123-1231-1231', 
                    "testing123@gmail.com"
                  ),
                  iconHeader(
                    height, 
                    width, 
                    'About Us', 
                    'Learn more about Gide', 
                    'assets/icons/profile/info.svg'
                  ),
                  aboutUsBox(
                    height, 
                    width
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconHeader(double height, double width, String headingOne, String headingTwo, String iconPath){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: width * .09,
            width: width * .09,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color(0xFF4670C1),
            ),
            child: SvgPicture.asset(iconPath, fit: BoxFit.scaleDown),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  headingOne,
                  style: GoogleFonts.poppins(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  headingTwo,
                  style: GoogleFonts.poppins(fontSize: 10, color: const Color(0xFF838383)),
                ),
              )
            ],
          )
        ],
      )
    );
  }

  Widget profileBox(double height, double width, String user, String name, String phoneNumber, String email){
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(11)
      ),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                height: height * .07125,
                width: height * .07125,
                margin: const EdgeInsets.only(right: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(
                    'assets/images/noodles.png',
                    fit: BoxFit.fill
                  ),
                ) 
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: GoogleFonts.poppins(fontSize: 16)),
                  Text(
                    '@' + user, 
                    style: GoogleFonts.poppins(
                      fontSize: 11, 
                      color: const Color(0xFF838383)
                    )
                  )
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset('assets/icons/profile/qrcode.svg'),
                ),
                Text('QR Code', style: GoogleFonts.poppins())
              ],
            )
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          profileEntry("Email", email),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          profileEntry("Phone Number", "123-123-1234")
        ],
      )
    );
  }

  Widget aboutUsBox(double height, double width){
    return Container(
      width: width * .844,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          boxEntry("Acknowledgements", 'assets/icons/profile/heart.svg', width, height),
        ],
      )
    );
  }

  Widget profileEntry(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 11, color: const Color(0xFF838383))
            ),
            Text(
              info,
              style: GoogleFonts.poppins(fontSize: 13)
            )
          ],
        ),
      ),
    );
  }

  Widget boxEntry(String title, String imagePath, double deviceWidth, double deviceHeight) {
    return Container(
      width: deviceWidth * .75,
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Padding(
              child: SvgPicture.asset(imagePath),
              padding: const EdgeInsets.only(right: 4)
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14
              ),
            )
          ],
        ),
      ),
    );
  }
}