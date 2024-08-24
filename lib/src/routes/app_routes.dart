import 'package:get/get.dart';
import 'package:mbs/src/screens/categories_screen.dart';
import 'package:mbs/src/screens/chat_screen.dart';
import 'package:mbs/src/screens/edit_pro_screen.dart';
import 'package:mbs/src/screens/home_screen.dart';
import 'package:mbs/src/screens/map_screen.dart';
import 'package:mbs/src/screens/messages_screen.dart';
import 'package:mbs/src/screens/navigation.dart';
import 'package:mbs/src/screens/profile_screen.dart';
import 'package:mbs/src/screens/service_screen.dart';


class RouteHelper {
  static const String initial = '/';
  static const String categories = '/categories';
  static const String chat = '/chat';
  static const String editPro = '/edit-pro';
  static const String home = '/home';
  static const String map = '/map';
  static const String messages = '/messages';
  static const String profile = '/profile';
  static const String service = '/service';

  static getInitialRoute() => initial;
  static getCategoriesRoute(String name) => '$categories?name=$name';
  static getChatRoute(String name) => '$chat?name=$name';
  static getEditProRoute(String name) => '$editPro?name=$name';
  static getHomeRoute(String name) => '$home?name=$name';
  static getMapRoute(String name) => '$map?name=$name';
  static getMessagesRoute(String name) => '$messages?name=$name';
  static getProfileRoute(String name) => '$profile?name=$name';
  static getServiceRoute(String name) => '$service?name=$name';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainScreen()),
    GetPage(name: categories, page: () => const CategoryPage()),
    GetPage(name: chat, page: () => const MessagingChatScreen()),
    GetPage(name: editPro, page: () => const EditProfileScreen()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: map, page: () => const MapScreen()),
    GetPage(name: messages, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: service, page: () => const AddServiceScreen()),
  ];
}
