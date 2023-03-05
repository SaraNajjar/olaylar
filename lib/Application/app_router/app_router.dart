
import 'package:get/get.dart';
import 'package:olaylar/module/event/event_details/event_details_screen.dart';
import 'package:olaylar/module/event/event_screen.dart';
import 'package:olaylar/module/event/explore_event/explore_event_screen.dart';
import 'package:olaylar/module/splash/splash_screen.dart';

class Routes {
   static const String splashRoute = '/';
   static const String eventRoute = '/event';
   static const String exploreEventRoute = '/exploreEventScreen';
   static const String filterRoute = '/home/filter';
   static const String eventDetailsRoute = '/eventDetails';
}

List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: Routes.splashRoute,
    page: () =>  SplashScreen(),
    transition: Transition.fade,
    transitionDuration: Duration(seconds: 1),
  ),
  GetPage(
    name: Routes.eventRoute,
    page: () =>  EventScreen(),
    transition: Transition.fade,
    transitionDuration: Duration(seconds: 1),
  ),
  // GetPage(
  //   name: Routes.boardRoute,
  //   page: () => onBoardScreen(),
  // ),
  GetPage(
    name: Routes.exploreEventRoute,
    page: () => ExploreEventScreen(),
  ),

  // GetPage(
  //   name: Routes.signUpRoute,
  //   page: () => SignUpScreen(),
  // ),
  // GetPage(
  //   name: Routes.forgetPassRoute,
  //   page: () => ForgetPasswordScreen(),
  // ),
  // GetPage(
  //   name: Routes.layoutRoute,
  //   page: () => LayoutScreen(),
  // ),
  // GetPage(
  //   name: Routes.inChatScreenRoute,
  //   page: () => InChatScreen(),
  // ),
  // // GetPage(
  // //   name: Routes.publicMarketRoute,
  // //   page: () => PublicMarketScreen(id: id,),
  // // ),
  // GetPage(
  //   name: Routes.filterRoute,
  //   page: () => FilterScreen(),
  // ),
  // GetPage(
  //   name: Routes.detailsProductRoute,
  //   page: () => DetailsProductScreen(),
  // ),
  // GetPage(
  //   name: Routes.advertiserRoute,
  //   page: () => AdvertiserScreen(),
  // ),
  // GetPage(
  //   name: Routes.profileRoute,
  //   page: () => ProfileScreen(),
  // ),
  // GetPage(
  //   name: Routes.editProfileRoute,
  //   page: () => EditProfileScreen(),
  // ),
  // GetPage(
  //   name: Routes.myAddsRoute,
  //   page: () => MyAddsScreen(),
  // ),
  // GetPage(
  //   name: Routes.myFavoriteRoute,
  //   page: () => MyFavoriteScreen(),
  // ),
  // GetPage(
  //   name: Routes.contactusRoute,
  //   page: () => ContactUsScreen(),
  // ),
  // GetPage(
  //   name: Routes.FAQRoute,
  //   page: () => FQAScreen(),
  // ),
  // GetPage(
  //   name: Routes.aboutUsRoute,
  //   page: () => AboutUsScreen(),
  // ),
  // GetPage(
  //   name: Routes.changePassRoute,
  //   page: () => ChangePasswordScreen(),
  // ),
  // GetPage(
  //   name: Routes.blockAccountRoute,
  //   page: () => BlockAccountScreen(),
  // ),
  // GetPage(
  //   name: Routes.termOfUseRoute,
  //   page: () => TermOfUseScreen(),
  // ),
  // GetPage(
  //   name: Routes.privacypolicyRoute,
  //   page: () => PrivacyPolicyScreen(),
  // ),

];