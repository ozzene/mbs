import 'package:get/get.dart';
import 'package:mbs/view/screens/auth/widgets/signinscreen.dart';
import 'package:mbs/view/screens/auth/widgets/signupscreen.dart';

import 'package:mbs/view/screens/splash/splashscreen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String surveyslist = '/surveyslist';
  static const String addsurveyquestion = '/addsurveyquestion';
  static const String createsurvey = '/createsurvey';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String editprofile = '/editprofile';
  static const String changenotifications = '/changenotifications';
  static const String security = '/security';
  static const String privacypolicy = '/privacypolicy';
  static const String category = '/category';
  static const String shopdashboard = '/shopdashboard';
  static const String addstock = '/addstock';
  static const String orderdetails = '/orderdetails';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getAuthRoute(String name) => '$auth?name=$name';
  static getRegisterRoute(String name) => '$register?name=$name';
  static getDashboardRoute(String name) => '$dashboard?name=$name';
  static getChangenotifications(String name) =>
      '$changenotifications?name=$name';
  static getEditprofile(String editprofile) => '$editprofile?name=$editprofile';
  static getPrivacypolicy(String privacypolicy) =>
      '$privacypolicy?name=$privacypolicy';
  static getSecurity(String security) => '$security?name=$security';
  static getsurveyslistRoute(String name) => '$surveyslist?name=$name';
  static getAddsurveyquestionRoute(String name) =>
      '$addsurveyquestion?name=$name';
  static getCreatesurveyRoute(String name) => '$createsurvey?name=$name';
  static getProfileRoute(String name) => '$profile?name=$name';
  static getSearchRoute(String name) => '$search?name=$name';
  static getCategoryRoute(String name) => '$category?name=$name';
  static getShopDashboardRoute(String name) => '$shopdashboard?name=$name';
  static getAddStockRoute(String name) => '$addstock?name=$name';
  static getOrdersDeatilsRoute(String name) => '$orderdetails?name=$name';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: auth,
      page: () => const SignInScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: register,
      page: () => const SignUpScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
   
   
  ];
}
