import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphzing/presentation/pages/screens/journal/image_list_view_screen.dart';
import 'package:morphzing/presentation/pages/screens/journal/journal_screen.dart';
import 'package:morphzing/presentation/pages/screens/journal/journey_screen.dart';
import 'package:morphzing/presentation/pages/screens/journal/painting_screen.dart';
import 'package:morphzing/presentation/pages/screens/registration/singup/sign_up_after_social.dart';
import 'package:morphzing/presentation/routers/rout_names.dart';

import '../../presentation/pages/screens/agenda/agenda_screen.dart';
import '../../presentation/pages/screens/agenda/todo/this_moth/this_month_screen.dart';
import '../../presentation/pages/screens/agenda/todo/this_year/this_year_screen.dart';
import '../../presentation/pages/screens/agenda/todo/today/today_screen.dart';
import '../../presentation/pages/screens/agenda/todo/todo_screen.dart';
import '../../presentation/pages/screens/home_screen.dart';
import '../../presentation/pages/screens/onboarding/first_screen.dart';
import '../../presentation/pages/screens/onboarding/second_screen.dart';
import '../../presentation/pages/screens/onboarding/third_screen.dart';
import '../../presentation/pages/screens/registration/login_screen.dart';
import '../../presentation/pages/screens/registration/password/code_verification.dart';
import '../../presentation/pages/screens/registration/password/recovery_password.dart';
import '../../presentation/pages/screens/registration/password/reset_password.dart';
import '../../presentation/pages/screens/registration/singup/about_me_screen.dart';
import '../../presentation/pages/screens/registration/singup/create_password_screen.dart';
import '../../presentation/pages/screens/registration/singup/enter_name_screen.dart';
import '../../presentation/pages/screens/registration/singup/sign_up_screen.dart';
import '../../presentation/pages/screens/registration/singup/sign_up_verification_screen.dart';
import '../../presentation/pages/screens/splash_screen.dart';
import '../../presentation/pages/screens/world_changers/world_changers_screen.dart';

class AppRouter {
  static GetPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return GetPageRoute(page: () => const SplashScreen());
      case journey:
        return GetPageRoute(page: () => const JourneyScreen());
      case painter:
        return GetPageRoute(page: () => const PaintingScreen());
      case allImages:
        return GetPageRoute(page: () => const ImageListViewScreen());
      case second:
        return GetPageRoute(page: () => const SecondScreen());
      case third:
        return GetPageRoute(page: () => const ThirdScreen());
      case first:
        return GetPageRoute(page: () => const FirstScreen());
      case login:
        return GetPageRoute(page: () => const LoginScreen());
      case signUp:
        return GetPageRoute(page: () => const SignUpScreen());
      case aboutMe:
        return GetPageRoute(page: () => const AboutMeScreen());
      case home:
        return GetPageRoute(page: () => const HomeScreen());
      case worldChangers:
        return GetPageRoute(page: () => const WorldChangersScreen());
      case todo:
        return GetPageRoute(page: () => const TodoListScreen());
      case today:
        return GetPageRoute(page: () => const TodayScreen());
      case thisMonth:
        return GetPageRoute(page: () => const ThisMonthScreen());
      case thisYear:
        return GetPageRoute(page: () => const ThisYearScreen());
      case agenda:
        return GetPageRoute(page: () => const AgendaScreen());
      case journal:
        return GetPageRoute(page: () => const JournalScreen(),);
      case recoveryPass:
        return GetPageRoute(page: () => const RecoveryPasswordScreen());
      case enterName:
        List list = settings.arguments as List;
        return GetPageRoute(
            page: () => EnterNameScreen(
                  password: list[0],
                ));
      case afterSocial:
        List list = settings.arguments as List;
        return GetPageRoute(
            page: () => SignUpAfterSocial(
              password: list[0],
            ));
      case createPassword:
        return GetPageRoute(page: () => const CreatePasswordScreen());
      case codeVerification:
        List list = settings.arguments as List;

        return GetPageRoute(
          page: () => CodeVerificationScreen(
            email: list[0],
          ),
        );
      case signUpVerification:
        List list = settings.arguments as List;
        return GetPageRoute(
          page: () => SignUpVerificationScreen(
            email: list[0],
            isSocial: list[1],
            bio: list[2],
            birthDate: list[3],
            fullName: list[4],
            secret: list[5],
            sex: list[6],
          ),
        );
      case resetPass:
        return GetPageRoute(page: () => const ResetPasswordScreen());
      default:
        return GetPageRoute(
            page: () => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
