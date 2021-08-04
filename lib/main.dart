import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:high_hat/application/schedule_app_service.dart';
import 'package:high_hat/application/user_app_service.dart';
import 'package:high_hat/infrastructure/schedule/schedule_factory.dart';
import 'package:high_hat/infrastructure/schedule/schedule_repository.dart';
import 'package:high_hat/infrastructure/user/user_factory.dart';
import 'package:high_hat/infrastructure/user/user_repository.dart';
import 'package:high_hat/presentation/pages/Login/login_page.dart';
import 'package:high_hat/presentation/pages/home/account/account_page.dart';
import 'package:high_hat/presentation/pages/home/friend/friend_page.dart';
import 'package:high_hat/presentation/pages/home/schedule/register_schedule_page.dart';
import 'package:high_hat/presentation/pages/home/schedule/schedule_page.dart';
import 'package:high_hat/presentation/pages/login/login_check_page.dart';
import 'package:high_hat/presentation/notifier/answer_notifier.dart';
import 'package:high_hat/presentation/notifier/schedule_notifier.dart';
import 'package:high_hat/presentation/notifier/user_notifier.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'common/helper/helpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Intl.defaultLocale = 'ja_JP';
  await initializeDateFormatting('ja_JP');

  runApp(
    MultiProvider(
      providers: [
        Provider<UserRepositoryBase>(create: (context) => UserRepository()),
        ChangeNotifierProvider<UserNotifier>(
          create: (context) => UserNotifier(
            service: UserAppService(
              userFactory: UserFactory(),
              userRepository: context.read<UserRepositoryBase>(),
            ),
          ),
        ),
        ChangeNotifierProvider<ScheduleNotifier>(
          create: (context) => ScheduleNotifier(
            service: ScheduleAppService(
              scheduleFactory: ScheduleFactory(),
              scheduleRepository: ScheduleRepository(),
              userRepository: context.read<UserRepositoryBase>(),
            ),
          ),
        ),
        ChangeNotifierProvider<AnswerNotifier>(
          create: (context) => AnswerNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Helpers.defaultThemeData(),
      darkTheme: Helpers.defaultDarkThemeData(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: LoginCheckPage.id,
      routes: {
        LoginCheckPage.id: (context) => const LoginCheckPage(),
        LoginPage.id: (context) => LoginPage(),
        SchedulePage.id: (context) => const SchedulePage(),
        RegisterSchedulePage.id: (context) => const RegisterSchedulePage(),
        FriendPage.id: (context) => const FriendPage(),
        AccountPage.id: (context) => const AccountPage(),
      },
    );
  }
}
