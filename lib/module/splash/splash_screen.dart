import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:olaylar/helpers/image_helper.dart';
import 'package:olaylar/module/splash/splash_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/color_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<SplashController>(
            builder: (controller) => Scaffold(

                  body:  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.deepPurple.shade400,
                                  Colors.deepPurple.shade300,
                                  Colors.blue.shade200,
                                ])),
                      ),

                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height/2.8,
                            width: MediaQuery.of(context).size.width/2,
                          ),
                          Center(
                            child: Column(
                              children: [
                                SvgPicture.asset(ImageHelper.logoIcon),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                    'Türk Olaylar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SFUI-Regular',
                                  fontSize: 18
                                ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              children: [
                                SvgPicture.asset(ImageHelper.loadingIcon),
                                SizedBox(height: 20.h,),
                                Text('L O A D I N G',style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'SFUI-Light',
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                )
        )
    );
  }
}
