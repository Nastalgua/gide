import 'package:flutter/cupertino.dart';
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
              child: Center(
                  child: Container(
                    width: width * .844,
                    child: Column(
                      children: [
                        textAndIcon(true, height, width, 'Account', 'Edit and manage your account details', 'assets/icons/profile/settings.svg'),
                        profileBox(height, width, 'hi', 'hi', '123-1231-1231', "testing123@gmail.com"),
                        textAndIcon(false, height, width, 'About Us', 'Learn more about Gide', 'assets/icons/profile/info.svg'),
                        aboutUsBox(height, width)
                      ],
                    ),
                  ),
                ),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget textAndIcon(bool topArea, double height, double width, String top, String bottom, String icon){
    return SafeArea(
      top: topArea,
      child: Container(
        height: height * .09875,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: width * .09,
                width: width * .09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Color(0xFF4670C1),
                ),
                child: SvgPicture.asset(
                    icon,
                    fit: BoxFit.scaleDown
                  ),
              ),
              Container(
                width: width * .5694,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: width * .538,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              top
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              bottom,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF838383),
                              ),
                            ),
                          )
                        ],
                      ),
                  ),
                ),
                
              )
              
            ],
          )
        )
      )
    );
  }

  Widget profileBox(double height, double width, String user, String name, String phoneNumber, String email){
    return Flexible(
      child: Container(
        height: height * .35,
        width: width * .844,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(11)
        ),
        child: Center(
          child: Container(
            height: height* .3,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //pic user and name
                Container(
                  height: height *.08,
                  width: width * .7556,
                  child: Row(
                    children: [
                      Container(
                        height: height* .07125,
                        width: height * .07125,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset(
                                'assets/images/noodles.png',
                                fit: BoxFit.fill
                              ),
                        )
                          
                      ),
                      SizedBox(
                        width: width * .01125
                      ),
                      Container(
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ' + name,
                                style: TextStyle(
                                  fontSize: 16
                                )
                              ),
                            ),
                            Text(
                              ' @' + user,
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF838383)
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  
                ),

                Container(
                  height: height * .05,
                  width: width * .7556,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                       child: SvgPicture.asset('assets/icons/profile/qrcode.svg')

                      ),
                      Text(
                        '   QR Code'
                      )
                    ],
                  )
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  indent: width * .0444,
                  endIndent: width * .0444,
                ),

                Container(
                  width: width * .7556,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         'Email',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF838383)
                          )
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         email,
                          style: TextStyle(
                            fontSize: 13,
                            
                          )
                        ),
                      )
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  indent: width * .0444,
                  endIndent: width * .0444,
                ),
                
                Container(
                  width: width * .7556,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                         'Phone Number',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF838383)
                          )
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          phoneNumber,
                          style: TextStyle(
                            fontSize: 13,
                            
                          )
                        ),
                      )
                    ],
                  ),
                ),

            
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget aboutUsBox(double height, double width){
    return Container(
      height: height * .1375,
      width: width * .844,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Center(
        child: Container(
          width: width * 7556,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Container(
                width: width * .73,
                height: height * .028,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      children: [
                        Container(
                        height: height * .0285,
                        child: Center(child: SvgPicture.asset('assets/icons/profile/question.svg'))
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 14

                          ),
                        )
                      ],
                    ),
                  
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                indent: width * .0444,
                endIndent: width * .0444,
              ),
              Container(
                width: width * .73,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      children: [
                        Container(
                          height: height * .0225,
                          width: width * .0556,
                          child: Center(child: SvgPicture.asset('assets/icons/profile/heart.svg'))
                        ),
                        Text(
                          'Acknowledgements',
                          style: TextStyle(
                            fontSize: 14

                          ),
                        )
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}