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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                top,
                style: const TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                bottom,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF838383),
                )
              )
            ],
          ),
        )
      ],
    );
  }

  Widget profileBox(double height, double width, String user, String name, String phoneNumber, String email){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width:  width * .844,
        height: height * .349,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
           borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
            padding: EdgeInsets.only(top: width * .067, left: width * .067, right: width * .067),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: width * .04),
                      child: Container(
                        height: width * .133,
                        width: width * .133,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11)
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/noodles.png'),
                          fit: BoxFit.cover  
                        )
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: height * .005),
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            )
                          ),
                        ),
                        Text(
                          '@' + user,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xFF838383),
                          )  
                        )
                      ],
                    )
                  ],
                ),
                //qrcode
                Padding(
                  padding: EdgeInsets.only(top: width * .0175, bottom: width * .0175),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * .02, right: width * .04 ),
                        child: Container(
                          height: width * .0667,
                          width: width * .0667,
                          child: SvgPicture.asset('assets/icons/profile/qrcode.svg')
                        )
                      ),
                      const Text(
                        'QR CODE',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13
                        )
                      ),
                    ],
                  ),
                ),
          
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
          
                Padding(
                  padding: EdgeInsets.only(left: width * .02, top: height * .0168, bottom: height * .0168),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFF838383),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          email,
                          style: TextStyle(
                            fontSize: 11
                          )
                        )
                      ),
                    ],
                  ),
                ),
                
          
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
          
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * .02, top: height * .0168),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Phone Number',
                            style: TextStyle(
                              fontSize: 9,
                              color: Color(0xFF838383),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            phoneNumber,
                            style: TextStyle(
                              fontSize: 11
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
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
          padding: EdgeInsets.only(left: width * .067, right: width * .067),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              //pfp + name + user
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                    
                    Padding(
                      padding: EdgeInsets.only(right: width * .005),
                      child: Container(
                        height: width * .04,
                        width: width * .04,
                        child: SvgPicture.asset('assets/icons/profile/question.svg')
                      ),
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                  height: 1,
                  thickness: 1,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Padding(
                      padding: EdgeInsets.only(right: width * .01),
                      child: Container(
                        height: width * .04,
                        width: width * .04,
                        child: SvgPicture.asset('assets/icons/profile/heart.svg')
                      ),
                    ),
              
                    Text(
                      'Acknowledgements',
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
              
                  ],
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}