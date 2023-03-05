

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:olaylar/helpers/drawer.dart';
import 'package:olaylar/helpers/image_helper.dart';
import 'package:olaylar/module/drawer/partner/partner_controller.dart';

class PartnerScreen extends StatelessWidget {
   PartnerScreen({Key? key}) : super(key: key);

   final controller = Get.put(PartnerController());

   @override
  Widget build(BuildContext context) {
    return GetBuilder<PartnerController>(
      builder:(controller)=>Scaffold(
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
              child: Builder(
                  builder:(context)=>Column(
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
                                    'Partners',
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    controller.isLoadingRequest
                        ?
                        Center(child: CircularProgressIndicator())
                        :
                        _buildMainBody()
                  ]))
          )
        ]),
      ),
    ),
    );

  }

  RefreshIndicator _buildMainBody() {
    return RefreshIndicator(
        onRefresh: () {
          return controller.getPartner();
        },
        child: controller.tPartner!.items!.isEmpty
            ? Text(
          "empty",
          style: TextStyle(fontSize: 50),
        ): buildGridView(controller)
    );
  }

  Widget buildGridView(PartnerController controller) {
    return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 161.w / 132.h,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    padding: EdgeInsetsDirectional.all(10),
                    children: List.generate(controller.tPartner!.items!.length, (index) {
                      return GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Image(image: NetworkImage(
                                '${controller.tPartner!.items![index].image}'
                            )
                              ,),
                          ));

                    }),
                  );
  }
}