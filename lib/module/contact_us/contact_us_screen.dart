import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:olaylar/helpers/color_helper.dart';
import 'package:olaylar/module/contact_us/contact_us_controller.dart';
import 'package:olaylar/utils/utils.dart';
import 'package:olaylar/widgets/components/components.dart';
import 'package:olaylar/widgets/textformfield.dart';

import '../../../helpers/image_helper.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ContactController>
        (
        builder: (controller)=>SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepPurple.shade400,
                      Colors.deepPurple.shade300,
                      Colors.deepPurple.shade200,
                      Colors.deepPurple.shade100,
                    ])),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.05),
                  Colors.white.withOpacity(0.2),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: SvgPicture.asset(ImageHelper.menuIcon)),
                            Expanded(
                              child: Center(
                                  child: Text(
                                    'Contact Us',
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  )),
                            ),
                          ],

                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.phone,color: ColorManager.iconColor,),
                                        ),
                                        Text(
                                          'Contact Info',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily:'SFUI-Meduim'
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                itemDetails(ImageHelper.loIcon,'Mobile : +966 555 555 555'),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 1,
                                                  color: ColorManager.DividerColor,
                                                ),
                                                itemDetails(ImageHelper.clockIcon,'Mail : mail@mail.com'),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 1,
                                                  color: ColorManager.DividerColor,
                                                ),
                                                itemDetails(ImageHelper.dateIcon,'Socail media: @Accounts'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20,
                                right: 20,
                                left: 20
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 3),
                                          child: Icon(Icons.email,color: ColorManager.iconColor,),
                                        ),
                                        Text(
                                          'Contact Form',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily:'SFUI-Meduim'
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          textFormField(
                                            keyboardType: TextInputType.text,
                                            textEditingController: controller.fullNameController,
                                            hintText: 'Name',
                                            validator: (value){
                                              if(value!.isEmpty)return 'must enter value';
                                            },
                                          ),
                                          SizedBox(height: 20.h,),
                                          textFormField(
                                            keyboardType: TextInputType.text,
                                            textEditingController: controller.emailController,
                                            hintText: 'Email',
                                            validator: (value){
                                              if(value!.isEmpty)return 'must enter value';                                              },
                                          ),
                                          SizedBox(height: 20.h,),
                                          textFormField(
                                            keyboardType: TextInputType.text,
                                            textEditingController: controller.mobileController,
                                            hintText: 'mobile',
                                            validator: (value){
                                              if(value!.isEmpty)return 'must enter value';                                            },
                                          ),
                                          SizedBox(height: 20.h,),
                                          textFormField(
                                            keyboardType: TextInputType.text,
                                            textEditingController: controller.commentController,
                                            hintText: 'Message',
                                            maxline: 5,
                                            hieght: 120.h,
                                            validator: (value){
                                              if(value!.isEmpty)return 'must enter value';
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20
                            ),
                            child: Material(
                              elevation: 4,
                              shadowColor: Colors.blueAccent.shade100,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(12),
                              child: D_MaterialButton(onPressed: (){
                                dismissKeyboard();
                                if(_formKey.currentState!.validate())
                                  controller.postContact();

                              }, child: Text('Add Event',style: TextStyle(
                                  color: ColorManager.iconColor,
                                  fontFamily: 'SFUI-Regular',
                                  fontSize: 16
                              ),), width: double.infinity),
                            ),
                          )

                        ],
                      ),
                    )
                  ]))
        ]),
      ),
      )

    );
  }
  Widget itemDetails(String icon, String  text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(icon,color: ColorManager.iconColor,),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Text(
                '$text',
                style: TextStyle(fontSize: 13, fontFamily: 'SFUI-Regular'),
              )),
        ],
      ),
    );
  }

}
