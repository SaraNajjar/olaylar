import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:olaylar/helpers/image_helper.dart';
import 'package:olaylar/module/event/explore_event/explore_event_controller.dart';
import 'package:olaylar/widgets/components/components.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ExploreEventScreen extends StatelessWidget {
  const ExploreEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.deepPurple.shade400,
                        Colors.deepPurple.shade300,
                        Colors.deepPurple.shade200,
                        Colors.blueAccent.shade200
                      ]
                  )
              ),
            ),
            GetBuilder<EventExplore>(builder: (controller)=>SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: [
                            Expanded(child: Center(child: Text('Explore Events',style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SFUI-Regular',

                            ),)),),
                            IconButton(
                                onPressed: (){
                                  Get.back();
                                },
                                icon: SvgPicture.asset(ImageHelper.closeIcon))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('By Categories',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SFUI-Regular',
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            controller.isLoadingRequest
                            ?
                            Center(child: CircularProgressIndicator())
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
                                              controller.tCategory!.items!.length, (index) {
                                            return GestureDetector(
                                              onTap: () {
                                                controller.changeCategoryType(
                                                    index: index);
                                                Navigator.pop(context);
                                              },
                                              child: ListTile(
                                                leading: Image(
                                                  image: NetworkImage(
                                                      controller
                                                          .tCategory!.items![index].image!),
                                                  width: 23.w,
                                                  height: 23.h,
                                                ),
                                                title: Text(
                                                  controller.tCategory!.items![index].title!,
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
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 25.w,
                                  height: 25.h,
                                  child: Image.network(controller.tCategory!.items![controller.categoryIndex].image!)),
                              SizedBox(width: 10.w,),
                              Text(
                                  '${controller.tCategory!.items![controller.categoryIndex].title!}',
                              style: TextStyle(
                                color: Colors.white,
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
                    SizedBox(height: 40,),
                    Text('By Date',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SFUI-Regular',
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      height: 310,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: SfDateRangePicker(
                        selectionColor: HexColor('#817BF3'),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                            blackoutDateTextStyle: TextStyle(
                                color: HexColor('#F2F4FB')
                            )
                        ),
                        headerStyle: DateRangePickerHeaderStyle(
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            color: HexColor('#4DABFF'),
                            fontSize: 16,
                          ),
                        ),

                        //onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                        initialSelectedRange: PickerDateRange(
                            DateTime.now().subtract(const Duration(days: 1)),
                            DateTime.now().add(const Duration(days: 1))),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Material(
                      elevation: 4,
                      shadowColor: Colors.blueAccent.shade100,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(12),
                      child: D_MaterialButton(onPressed: (){}, child: Text('SELECT',style: TextStyle(
                        color: HexColor('#817BF3'),
                        fontFamily: 'SFUI-Regular',
                      ),), width: double.infinity),
                    )
                  ],
                ),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
