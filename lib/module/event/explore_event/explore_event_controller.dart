import 'package:get/get.dart';
import 'package:olaylar/Api/Repo/category_repo.dart';
import 'package:olaylar/model/category.dart';
class EventExplore extends GetxController {

  int categoryIndex = 0;

  void changeCategoryType({required int index}) {
    categoryIndex = index;
    update();
  }

  var isLoadingRequest = false;
  TCategory? tCategory;


  getCategory() async {
    try {
      isLoadingRequest = true;
      update();
      tCategory = await getCategoryRepo.instance.getCategoryRequest();
      update();
      isLoadingRequest = false;
      update();
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getCategory();
    super.onInit();
  }
}
