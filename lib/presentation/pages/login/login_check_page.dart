import 'package:flutter/material.dart';

import 'package:high_hat/presentation/notifier/user_notifier.dart';
import 'package:high_hat/presentation/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

class LoginCheckPage extends StatelessWidget {
  const LoginCheckPage({Key? key}) : super(key: key);

  static const id = 'login_check_page';
  @override
  Widget build(BuildContext context) {
    final isLogin = context.select(
      (UserNotifier notifier) => notifier.loggedIn,
    );

    return isLogin ? const HomePage() : const LoginPage();
  }
}
