import 'dart:io';

import 'package:codigo_project/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'movie/bloc/detail/detail_bloc.dart';
import 'movie/bloc/popular/popular_bloc.dart';
import 'movie/bloc/upcomming/upcomming_bloc.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
        providers: [
          BlocProvider<DetailBloc>(
              create: (BuildContext context) => DetailBloc()),
          BlocProvider<PopularBloc>(
              create: (BuildContext context) => PopularBloc()),
          BlocProvider<UpcommingBloc>(
              create: (BuildContext context) => UpcommingBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          title: 'Codigo Project',
          home: SplashScreen(),
        ));
  }
}