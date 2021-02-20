

import 'package:flutter/material.dart';
import 'package:puvitest/abnormalGraph.dart';
import 'package:puvitest/sector.dart';
import 'Dashboard.dart';
import 'navigator.dart';
import 'normalGraph.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routes = {
      "/": (context) => Dashboardpage(),
      "/nav": (context) => NavigatorIn(),
      "/sec":(context)=>SectorIn(),
      "/Norgraph":(context)=>LineMultiColor(key),
      "/abNorgraph":(context)=>AbLineMultiColor(key)
    };

    return MaterialApp(
      title: 'PuviIOT',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      onGenerateRoute: (settings){
        final String name = settings.name;
        final Function pageContentBuilder = routes[name];
        Route route= MaterialPageRoute(
            settings: settings,
            builder: (context) => pageContentBuilder(context));
        return route;
      },

    );
  }
}
