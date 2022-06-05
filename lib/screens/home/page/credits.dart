import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/core/constants/route_constants.dart';
import 'package:gide/core/models/credit_model.dart';
import 'package:gide/core/models/store_model.dart';
import 'package:gide/core/models/user_model.dart';
import 'package:gide/core/services/auth_service.dart';
import 'package:gide/core/services/store_service.dart';
import 'package:gide/screens/home/page/favorites.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({Key? key}) : super(key: key);

  @override
  State<CreditsPage> createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  var _userStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userStream = FirebaseFirestore.instance.collection("users").doc(AuthenticationService.userInfo!.id).snapshots();
  }

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
                    child: AuthenticationService.userInfo != null ? StreamBuilder<Object>(
                      stream: _userStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Text("Loading");
                        }

                        User user = User.fromFirestore(snapshot.data as DocumentSnapshot<Map<String, dynamic>>, null);

                        List<Credit> creditsReversed = user.credits!.reversed.toList();

                        return creditsReversed.isNotEmpty ? ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) { 
                              Credit credit = creditsReversed[index];
                              DateTime expiredDate = credit.expireDate.toDate();
                              return creditTab(
                                credit.storeName,
                                (credit.amtOff * 10.0).toInt(),
                                "${expiredDate.month}/${expiredDate.day}/${expiredDate.year}",
                                height,
                                width
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemCount: creditsReversed.length
                          ),
                        ) : Container(
                          margin: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/icons/empty-box.svg'),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "There is nothing here...", 
                                  style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xFFC0C0C0)
                                  )
                                )
                              )
                            ],
                          )
                        );
                      }
                    ) : Container()
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget creditTab(String name, int percent, String date, double height, double width) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(qrCodeResultRoute);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.black,
        primary: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      child: Container(
        height: 100,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFFFFFFF)
        ),
        child: Row(
          children: [
            Container(
              
            )
          ]
        )
      ),
    );
  }

  /*
  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: width * .15,
                      width: width * .15,
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
        */
}
