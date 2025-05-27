import 'package:exam_4_oy_demo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:exam_4_oy_demo/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/cubits/reviews_cubit/reviews_cubit.dart';
import '../features/home/presentation/cubits/hotel_cubit/hotel_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HotelCubit()..fetchHotels()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ReviewsCubit()),
      ],
      child: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
