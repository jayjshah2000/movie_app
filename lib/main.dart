// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/user.dart';
import 'package:movie_app/screens/wrapper.dart';
import 'package:movie_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/screens/home/movie_details_screen.dart';
// import 'package:movie_app/screens/home/welcome.dart';
import 'package:movie_app/screens/home/dashboard_screen.dart';
import 'package:movie_app/model/movie.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
          value:AuthService().user,
          child: MaterialApp(
          home: Wrapper(), 
          debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.indigo,
        //   scaffoldBackgroundColor: Colors.white,
        // ),
        // home: HomePage(),
        routes: {
          DashboardScreen.routeName: (context) => DashboardScreen(),
          MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        },
      ),
    );
  }
}
