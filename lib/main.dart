import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morphzing/presentation/routers/rout_names.dart';
import 'package:morphzing/core/constants/router.dart';
import 'package:morphzing/utils/style/colors.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  static Locale? _locale;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _locale = const Locale('en');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: splash,
      title: 'Morphzing',
      theme: ThemeData.light().copyWith(
        primaryColor: bgColor,
      ),
    );
  }
}

//RziPBu9A_eaK6u_cTM-o