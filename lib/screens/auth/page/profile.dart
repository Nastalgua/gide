import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/widgets/navbar.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Material(
        color:Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Container(
              height: height,
              child: Padding(
                padding: EdgeInsets.only(left: width * .076, top: height * .055),
                child: Column(
                  children: [
                    textAndIcon(height, width, 'Account', 'Edit and manage your account details.', 'assets/icons/profile/settings.svg'),
                    profileBox(height, width, 'TESTING', 'TESTING', '123-0213-1023', 'testing@gmail.com'),
                    textAndIcon(height, width, 'About Us', 'Learn more about Gide.', 'assets/icons/profile/info.svg'),
                    aboutUsBox(height, width)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textAndIcon(double height, double width, String top, String bottom, String icon){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * .02, top: height * .02, bottom: height * .02),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF4670C1),
              borderRadius: BorderRadius.circular(8)
            ),
            height: width * .08,
            width: width * .08,
            child: Padding(
              padding: EdgeInsets.all(width * .02),
              child: SvgPicture.asset(icon),
            )
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              top,
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
            Text(
              bottom,
              style: TextStyle(
                fontSize: 11
              )
            )
          ],
        )
      ],
    );
  }

  Widget profileBox(double height, double width, String user, String name, String phoneNumber, String email){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width:  width * .844,
        height: height * .358,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
           borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.all(width * .067),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * .04),
                    child: Container(
                      height: width * .133,
                      width: width * .133,
                      child: SvgPicture.asset('assets/icons/navbar/person.svg')
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Text(user)
                    ],
                  )
                ],
              ),
              //qrcode
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width * .04, bottom: width * .04, right: width * .04 ),
                    child: Container(
                      height: width * .075,
                      width: width * .075,
                      child: SvgPicture.asset('assets/icons/profile/qrcode.svg')
                    )
                  ),
                  const Text(
                    'QR CODE',
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    )
                  ),
                ],
              ),

              
            ],
          )
        )
      ),
    );
  }

  Widget aboutUsBox(double height, double width){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width:  width * .844,
        height: height * .1357,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
           borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.all(width * .067),
          child: Column(
            children: [
              //pfp + name + user
              Row(
                children: [
    
                ],
              )
            ],
          )
        )
      ),
    );
  }
}