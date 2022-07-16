import 'package:dio_wrapper_demo/core/store/api_store.dart';
import 'package:dio_wrapper_demo/ui/screen/add_professors_screen/add_profess_screen.dart';
import 'package:dio_wrapper_demo/ui/screen/add_professors_screen/store/add_professor_store.dart';
import 'package:dio_wrapper_demo/ui/screen/main_listing_screen/main_add_professor_screen.dart';
import 'package:dio_wrapper_demo/ui/screen/main_listing_screen/store/main_listing_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenStore>(create: (context) => MainScreenStore(),),
        ChangeNotifierProvider<AddProfessorStore>(create: (context) => AddProfessorStore(),),
        ChangeNotifierProvider<ApiStore>(create: (context) => ApiStore(),),
      ],
      child: MaterialApp(
        title: "Dio Wrappper Demo",
        debugShowCheckedModeBanner: false,
        initialRoute: MainListingScreen.routeName,
        routes: {
          MainListingScreen.routeName: (context) => const MainListingScreen(),
          AddProfessorScreen.routeName: (context) => const AddProfessorScreen(),
        },
      ),
    );
  }
}
