import 'dart:ui';

import 'package:bw_home_bridge/backend/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/mc_colors.dart';
import 'utils/mc_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  final Uri currentUrl;

  const App({super.key, required this.currentUrl});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // await Future.delayed(const Duration(milliseconds: 0), () {});
    // await Future.delayed(const Duration(milliseconds: 3000), () {});

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        routerConfig: McRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'm',
        locale: const Locale('en', 'US'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: McColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.jostTextTheme(
              // ignore: use_build_context_synchronously
              Theme.of(context).textTheme),
          scaffoldBackgroundColor: McColors.secondary2,
          // ignore: use_build_context_synchronously
          iconTheme: Theme.of(context).iconTheme.copyWith(
              // color: McColors.secondary,
              ),
          checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(Colors.white),
            fillColor: MaterialStateProperty.all(McColors.black),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: McColors.secondary2,
            foregroundColor: McColors.secondary2,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: McColors.secondary2,
            // backgroundColor: Colors.grey[300],
          ),
        ),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
