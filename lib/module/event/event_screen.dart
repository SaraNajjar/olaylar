import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:olaylar/helpers/drawer.dart';
import 'package:olaylar/helpers/image_helper.dart';
import 'package:olaylar/module/event/event_controller.dart';
import 'package:olaylar/module/event/event_details/event_details_controller.dart';
import 'package:olaylar/module/event/event_details/event_details_screen.dart';
import 'package:olaylar/module/event/explore_event/explore_event_screen.dart';

class EventScreen extends StatelessWidget {
  final controller = Get.put(EventController());
  final DetailsEventController controllerdetails = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(builder:(controller)=> Scaffold(
      drawer: DrawerHelper(),
      body: SafeArea(
        child: Stack(
          children: [
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
            Builder(
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
                                  'All Events',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'SFUI-Regular'),
                                )),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.to(()=>ExploreEventScreen());
                              },
                              icon: SvgPicture.asset(ImageHelper.filterIcon))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: controller.isLoadingRequest
                        ?
                    Center(child: CircularProgressIndicator())
                        :
                    _buildMainBody(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  ListView buildListView() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
            onTap: (){
              controllerdetails.getDetailsEvent(controller.tEvent!.items!.data![index].id!);
              Get.to(EventDetailsScreen(id: controller.tEvent!.items!.data![index].id!,));
            },
            child: buildItem(index)),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemCount: controller.tEvent!.items!.data!.length);
  }

  Widget buildItem(int index) {
    return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Container(
                width: double.infinity,
                height: 145.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120.w,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                              vertical: 28,
                              horizontal: 10),
                      child: Container(
                        width: 250.w,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.tEvent!.items!.data![index].title}',
                              style: TextStyle(
                                  fontFamily:
                                      'SFUI-Medium',
                                  color: Colors.black,
                                  fontSize: 16),
                              maxLines: 1,
                              overflow:
                                  TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    ImageHelper
                                        .mapsIcon),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 100,
                                  child: Text(
                                    '${controller.tEvent!.items!.data![index].address}',
                                    style: TextStyle(
                                        fontFamily:
                                            'SFUI-Regular',
                                        fontSize: 13),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    ImageHelper
                                        .unionIcon),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${controller.tEvent!.items!.data![index].dateFrom}',
                                  style: TextStyle(
                                      fontFamily:
                                          'SFUI-Regular',
                                      fontSize: 13),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  width: 134.w,
                  height: 100.h,
                  clipBehavior:
                      Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: '${controller.tEvent!.items!.data![index].image}',
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.network(
                    'https://as2.ftcdn.net/v2/jpg/03/71/39/53/1000_F_371395391_XJeH0MxOVDLEn8zYhZcf9EsuB5M2CwKa.jpg',
                    fit: BoxFit.cover,
                  )),
                  )),

          ],
        ),

        //alignment: Alignment.bottomRight,
        Positioned(
          right: 0,
          bottom: 40,
          child: Container(
            decoration: BoxDecoration(
                color: HexColor('#9970ED'),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Conference',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFUI-Regular',
                    fontSize: 10),
              ),
            ),
          ),
        ),
      ],
    ),
  );
  }

  RefreshIndicator _buildMainBody() {
    return RefreshIndicator(
        onRefresh: () {
          return controller.getEvent();
        },
        child: controller.tEvent!.items!.data!.isEmpty
            ? Text(
          "empty",
          style: TextStyle(fontSize: 50),
        ): buildListView()
    );
  }
}


// Widget buildItem() {
//   return Padding(
//     padding: const EdgeInsets.only(left: 10),
//     child: Stack(
//       alignment: Alignment.centerRight,
//       children: [
//         Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 20,
//               ),
//               child: Container(
//                 width: double.infinity,
//                 height: 135.h,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     bottomLeft: Radius.circular(8),
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 120.w,
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsets.symmetric(
//                           vertical: 28,
//                           horizontal: 10),
//                       child: Container(
//                         width: 250.w,
//                         child: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Cappadocia Cycling Festival',
//                               style: TextStyle(
//                                   fontFamily:
//                                   'SFUI-Medium',
//                                   color: Colors.black,
//                                   fontSize: 16),
//                               maxLines: 1,
//                               overflow:
//                               TextOverflow.ellipsis,
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                     ImageHelper
//                                         .mapsIcon),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   'Gaza',
//                                   style: TextStyle(
//                                       fontFamily:
//                                       'SFUI-Regular',
//                                       fontSize: 13),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                     ImageHelper
//                                         .unionIcon),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '20,Aug 2019',
//                                   style: TextStyle(
//                                       fontFamily:
//                                       'SFUI-Regular',
//                                       fontSize: 13),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                   width: 134.w,
//                   height: 100.h,
//                   clipBehavior:
//                   Clip.antiAliasWithSaveLayer,
//                   decoration: BoxDecoration(
//                     borderRadius:
//                     BorderRadius.circular(12),
//                   ),
//                   child: Image.network(
//                     'https://as2.ftcdn.net/v2/jpg/03/71/39/53/1000_F_371395391_XJeH0MxOVDLEn8zYhZcf9EsuB5M2CwKa.jpg',
//                     fit: BoxFit.cover,
//                   )),
//             ),
//           ],
//         ),
//
//         //alignment: Alignment.bottomRight,
//         Positioned(
//           right: 0,
//           bottom: 40,
//           child: Container(
//             decoration: BoxDecoration(
//                 color: HexColor('#9970ED'),
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(12),
//                     bottomLeft: Radius.circular(12))),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Conference',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'SFUI-Regular',
//                     fontSize: 10),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }