import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:olaylar/helpers/color_helper.dart';
import 'package:olaylar/helpers/image_helper.dart';

import 'event_details_controller.dart';

class EventDetailsScreen extends StatelessWidget {
   final int id;
   final controller = Get.put(DetailsEventController());
   EventDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsEventController>(
        builder: (controller)=>Scaffold(
          backgroundColor: ColorManager.scaffoldColor2,
          body: SafeArea(
            child: controller.isLoadingRequest
                ?
            Center(child: CircularProgressIndicator())
                :
            _buildMainBody(id),
          ),
        )
    );

  }

  Widget _buildItem(DetailsEventController controller) {
    return Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 18
                      ),
                      child: Container(
                        width:double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.deepPurple.withOpacity(0.8), BlendMode.modulate,),
                            image: NetworkImage(
                              '${controller.tDetailsEvent!.item!.image}'
                              //'https://www.shutterstock.com/image-photo/active-tourism-group-on-hicking-260nw-1245203446.jpg'
                              ,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed:(){
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                          Expanded(
                            child: Text('Event Details',style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SFUI-Regular',
                            ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 128.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(ImageHelper.clockIcon),
                                SizedBox(width: 5.w,),
                                Text(
                                  'Set Reminder',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'SFUI-Regular',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:  ColorManager.scaffoldColor2,
                      ),
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
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Event Info',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily:'SFUI-Meduim'
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          itemDetails(ImageHelper.loIcon,'${controller.tDetailsEvent!.item!.address}'),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 1,
                                            color: ColorManager.DividerColor,
                                          ),
                                          itemDetails(ImageHelper.clockIcon,'${
                                              controller.tDetailsEvent!.item!.timeFrom}  ${
                                              controller.tDetailsEvent!.item!.timeTo}'),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 1,
                                            color: ColorManager.DividerColor,
                                          ),
                                          itemDetails(ImageHelper.dateIcon,'${
                                              controller.tDetailsEvent!.item!.dateFrom
                                          }  ${controller.tDetailsEvent!.item!.dateTo}'),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Details',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily:'SFUI-Meduim'
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      '''${controller.tDetailsEvent!.item!.descriptionEn}
                                    ''',
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SFUI-Light'
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
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
                                    Text(
                                      'Organizer Info',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily:'SFUI-Meduim'
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          itemDetails(ImageHelper.phoneIcon,'${controller.tDetailsEvent!.item!.mobile}'),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 1,
                                            color: ColorManager.DividerColor,
                                          ),
                                          itemDetails(ImageHelper.clockIcon,' 09:00 AM- 06:00 PM'),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 1,
                                            color: ColorManager.DividerColor,
                                          ),
                                          itemDetails(ImageHelper.dateIcon,'${
                                              controller.tDetailsEvent!.item!.email}'),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: (){

                                                  }, icon: SvgPicture.asset(
                                                ImageHelper.FacebookIcon,
                                                color: ColorManager.iconColor,
                                              )),IconButton(
                                                  onPressed: (){

                                                  }, icon: SvgPicture.asset(
                                                ImageHelper.twitterIcon,
                                                color: ColorManager.iconColor,
                                              )) ,IconButton(
                                                  onPressed: (){
                                                  }, icon: SvgPicture.asset(
                                                ImageHelper.instagramIcon,
                                                color: ColorManager.iconColor,
                                              ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          );
  }

   RefreshIndicator _buildMainBody(id) {
     return RefreshIndicator(
         onRefresh: () {
           return controller.getDetailsEvent(id);
         },
         child: _buildItem(controller)
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
