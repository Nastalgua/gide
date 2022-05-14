import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child:Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [
            buildText(height, width),
            buildFields(height, width),
            buildButtons(height, width),
          ],
        )
      )
    );
  }

  Widget buildText(double height, double width){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.06125),
          child: Text(
            'Hello!',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800
            )
          )     
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.01125),
          child: Text(
            'Create an account here',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400
            )
          ),
        )

      ]
    );
  }

  Widget buildFields(double height, double width){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.055),
          child: Container(
            width: width * .8444,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                
                hintText: 'Enter email...',
                hintStyle: TextStyle(
                  color: Color(0xFFC2C2C2),
                  fontSize: 14
                ),
              ),
              
            )
          )
          
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.055),
          child: Container(
            width: width * .8444,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                
                hintText: 'Enter a username...',
                hintStyle: TextStyle(
                  color: Color(0xFFC2C2C2),
                  fontSize: 14
                ),
              ),
              
            )
          )
          
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: Container(
            width: width * .8444,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                
                hintText: 'Enter password...',
                hintStyle: TextStyle(
                  color: Color(0xFFC2C2C2),
                  fontSize: 14
                ),
              ),
              
            )
          )
          
        ),
      ],
    );
  }

  Widget buildButtons(double height, double width){
    return Column(
      children: [
         Padding(
          padding: EdgeInsets.only(top: height * 0.050),
          child: Container(
            width: width * .8444,
            height: height * .0837,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
    
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4670C1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              ),
              
              child: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15
                )
              )
              ,
            )
          )
        ),
        
        buildDivider(height, width),
        googleButton(height, width),
        Padding(
          padding: EdgeInsets.only(top: height * .0375),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already a member? ',
                
              ),
              GestureDetector(
                child: Text(
                  'Login',
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)
                ),
                onTap: () async {}
              )
              
            ],
          )
        )
      ],
    );
  }

  Widget buildDivider(double height, double width){
    return Padding(
      padding: EdgeInsets.only(top: height * 0.050),
      child: Container(
        width: width * .756,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Divider(
                height: 10,
                thickness: 1,
                endIndent: width * .02,
                color: Color(0xFFC2C2C2),
              ),
            ),
            
            Text(
              'Or continue with',
              style: TextStyle(
                    color: Color(0xFFC2C2C2),
                    fontSize: 14
              ),
            ),
            
            Expanded(
              child: Divider(
                height: 10,
                thickness: 1,
                indent: width * .02,
                color: Color(0xFFC2C2C2),
              ),
            ), 

          ]
        )
      )
    );
  }

  Widget googleButton(double height, double width){
    return Padding(
          padding: EdgeInsets.only(top: height * .0375),
          child: Container(
            width: width * .16,
            height: height * .0837,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
    
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFFC2C2C2),
                    width: 1.1736824632845932
                  ),
                  borderRadius: BorderRadius.circular(12),
                )
              ),
              
              child: SvgPicture.asset(
                'assets/icons/google.svg',
                width: 25,
                height: 25,
              )
              
            )
          )
      );
  }
}