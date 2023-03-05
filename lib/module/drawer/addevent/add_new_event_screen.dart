import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olaylar/helpers/color_helper.dart';
import 'package:olaylar/helpers/image_helper.dart';
import 'package:olaylar/module/drawer/addevent/add_new_event_controller.dart';
import 'package:olaylar/module/event/explore_event/explore_event_controller.dart';
import 'package:olaylar/widgets/components/components.dart';
import 'package:olaylar/widgets/textformfield.dart';
import 'dart:io';
import '../../../helpers/drawer.dart';

class AddEventScreen extends StatelessWidget {
   AddEventScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(addEventController());
  final controllerCategory = Get.put(EventExplore());
  @override
  Widget build(BuildContext context) {

    double width =MediaQuery.of(context).size.width-40;

    return Scaffold(
        drawer: DrawerHelper(),
        body: SafeArea(
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
          child: Form(
            key: _formKey,
            child:Builder(
              builder:(context)=> Column(
                children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: SvgPicture.asset(ImageHelper.menuIcon)),
                      Expanded(
                        child: Center(
                            child: Text(
                          'New Event',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            fontFamily: 'SFUI-Regular',
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => InkWell(
                onTap: (){
                  controller.pickImage();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          )
                      ),
                      child:   controller.img.value!=null
                          ?
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: FileImage(File('${controller.img.value}/flutter.png',),),
                      )
                          :
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurple.shade200
                            ),
                          )
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(ImageHelper.cameraIcon))
                  ],
                ),
              )),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Basic Event Info',style: TextStyle(
                            fontSize: 15,

                          fontFamily: 'SFUI-Meduim',
                        ),),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Container(
                              child: textFormField(
                                  width: width,
                                  hintText: 'Event Name in Arabic',
                                  keyboardType: TextInputType.text,
                                  textEditingController: controller.name_arController,
                                  validator: (value ) {
                                    if(value!.isEmpty) return 'must enter your name in Arabic';
                                  }
                              ),
                            ),
                            SizedBox(height: 10,),
                            textFormField(
                                width: width,
                                hintText: 'Event Name in English',
                                keyboardType: TextInputType.text,
                                textEditingController: controller.name_enController,
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter your name in English';
                                }
                            ),
                            SizedBox(height: 10,),
                            textFormField(
                                width: width,
                                hintText: 'Event Name in Turkish',
                                keyboardType: TextInputType.text,
                                textEditingController: controller.name_trController,
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter your name in Turkish';
                                }
                            ),
                            SizedBox(height: 10,),
                            textFormField(
                                width: width,
                                maxline: 5,
                                hintText: 'Description in Arabic',
                                keyboardType: TextInputType.text,
                                textEditingController: controller.description_arController,
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                }
                            ),
                            SizedBox(height: 10,),
                            textFormField(
                                width: width,
                                maxline: 5,
                                hintText: 'Description in English',
                                keyboardType: TextInputType.text,
                                textEditingController: controller.description_enController,
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                }
                            ),

                            SizedBox(height: 10,),
                            textFormField(
                                width: width,
                                maxline: 5,
                                hintText: 'Description in Turkish',
                                keyboardType: TextInputType.text,
                                textEditingController: controller.description_trController,
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                }
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',style: TextStyle(
                            fontSize: 15,
                          fontFamily: 'SFUI-Meduim',

                        ),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: () {
                            controllerCategory.isLoadingRequest
                            ?Center(child: CircularProgressIndicator())
                                :
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                scrollable: true,
                                title: const Text('Choose Category'),
                                content: Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Column(
                                    children: List.generate(
                                        controllerCategory.tCategory!.items!.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controllerCategory.changeCategoryType(
                                              index: index);
                                          Navigator.pop(context);
                                        },
                                        child: ListTile(
                                          leading: Image(
                                            image: NetworkImage(
                                                controllerCategory
                                                    .tCategory!.items![index].image!),
                                            width: 23.w,
                                            height: 23.h,
                                          ),
                                          title: Text(
                                            controllerCategory.tCategory!.items![index].title!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'SFUI-Regular'
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 45.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorManager.greyBorder
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 25.w,
                                      height: 25.h,
                                      child: Image.network(controllerCategory.tCategory!.items![controller.categoryIndex].image!)),
                                  SizedBox(width: 10.w,),
                                  Text(
                                    '${controllerCategory.tCategory!.items![controller.categoryIndex].title!}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUI-Regular'
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_drop_down_sharp,size: 25,color: Colors.white,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(8),
                        //     border: Border.all(
                        //       color: ColorManager.greyBorder
                        //     )
                        //   ),
                        //   child: DropdownButton(
                        //     underline: SizedBox(),
                        //     isExpanded: true,
                        //     hint: Text('-- Choose from here',style: TextStyle(
                        //       color: ColorManager.greyBorder
                        //     ),),
                        //       icon: Icon(Icons.arrow_drop_down,color: ColorManager.greyBorder,),
                        //       items: controllerCategory.tCategory!.items![index].title!,
                        //       onChanged: (s){
                        //
                        //       }),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Event Details',style: TextStyle(
                            fontSize: 15,
                          fontFamily: 'SFUI-Meduim',
                        ),),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Obx(() => InkWell(
                                 onTap:(){
                                   controller.choosefromDate();
                                 },
                                 child: buildItemDate(width,Text(
                                   DateFormat("dd-MM-yyyy").format(controller.selectedfromDate.value),
                                 ),
                                     ),
                               ),),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Obx(() => InkWell(
                                    onTap: (){
                                      controller.chooseToDate();
                                    },
                                    child: buildItemDate(
                                        width, Text(DateFormat("dd-MM-yyyy").format(controller.selectedtoDate.value))
                                    )))
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => InkWell(
                                  onTap: (){
                                    controller.choosefromTime();
                                  },
                                  child: buildItemDate(width, Text(
                                      '${controller.selectedFromTime.value.format(context)}')
                                  ),
                                )),

                                SizedBox(
                                  width: 5.w,
                                ),
                                Obx(() => InkWell(
                                  onTap: (){
                                    controller.chooseToTime();
                                  },
                                  child: buildItemDate(width, Text(
                                      '${controller.selectedToTime.value.format(context)}')
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            textFormField(
                                width: width,
                                hintText: '-- Choose from here',
                                keyboardType: TextInputType.text,
                                textEditingController: controller.locationController,
                                suffixIcon: Icon(Icons.edit_location_rounded,color: ColorManager.greyBorder,),
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                }

                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact Info',style: TextStyle(
                            fontSize: 15,
                          fontFamily: 'SFUI-Meduim',
                        ),),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            textFormField(
                                width: width,
                                keyboardType: TextInputType.text,
                                textEditingController: controller.emailController,
                                hintText: 'Email',
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                },
                              suffixIcon: Icon(Icons.email,color: ColorManager.greyBorder,)
                            ),
                            SizedBox(height: 20,),
                            textFormField(
                                width: width,
                                keyboardType: TextInputType.text,
                                textEditingController: controller.mobileController,
                                hintText: 'Mobile',
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                },
                              suffixIcon: Icon(Icons.phone_android_rounded,color: ColorManager.greyBorder,)
                            ),
                            SizedBox(height: 20,),
                            textFormField(
                                width: width,
                                keyboardType: TextInputType.text,
                                textEditingController: controller.websiteController,
                                hintText: 'Website',
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                },
                              suffixIcon: Icon(Icons.language,color: ColorManager.greyBorder,)
                            ),
                            SizedBox(height: 20,),
                            textFormField(
                                width: width,
                                keyboardType: TextInputType.text,
                                textEditingController: controller.facebookController,
                                hintText: 'Facebook',
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                },
                                suffixIcon: SvgPicture.asset(
                                    ImageHelper.FacebookIcon,
                                    fit: BoxFit.none,

                                )
                            ),
                            SizedBox(height: 20,),
                            textFormField(
                                width: width,
                                keyboardType: TextInputType.text,
                                textEditingController: controller.twitterController,
                                hintText: 'Twitter',
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                },
                                suffixIcon: SvgPicture.asset(
                                    ImageHelper.twitterIcon,
                                    fit: BoxFit.none,
                                )),
                            SizedBox(height: 20,),
                            textFormField(
                                width: width,
                                keyboardType: TextInputType.text,
                                textEditingController: controller.instController,
                                hintText: 'Instgram',
                                validator: (value ) {
                                  if(value!.isEmpty) return 'must enter value';
                                },
                                suffixIcon: SvgPicture.asset(
                                  ImageHelper.instagramIcon,
                                  fit: BoxFit.none,
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20
                ),
                child: Material(
                  elevation: 4,
                  shadowColor: Colors.blueAccent.shade100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(12),
                  child: D_MaterialButton(onPressed: (){
                    _formKey.currentState!.validate()
                        ?
                    controller.postEvent()
                        :
                    Container();
                  }, child: Text('Add Event',style: TextStyle(
                      color: ColorManager.iconColor,
                      fontFamily: 'SFUI-Regular',
                      fontSize: 16
                  ),), width: double.infinity),
                ),
              )
            ]),)
          ),
        )
      ]),
    ));
  }

  Container buildItemDate(double width,Widget widget) {
  return Container(
     width: width/2 -24,
     height: 50.h,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       border: Border.all(
         color: ColorManager.greyBorder
       ),
     ),
     child: Row(
       children: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: widget,
         ),),
         Icon(Icons.date_range,color: ColorManager.greyBorder,)
       ],
     ),
    );
  }
}