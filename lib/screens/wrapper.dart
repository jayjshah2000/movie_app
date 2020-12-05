import 'package:movie_app/screens/authenticate/authenticate.dart';

import '../model/user.dart';

// import 'package:movie_app/screens/home/welcome.dart';
import 'package:movie_app/screens/home/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return DashboardScreen();
    }
  }
}
