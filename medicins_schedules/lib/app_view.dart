import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicins_schedules/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:medicins_schedules/navigation/router.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: "Medicins Schedules",
          routerConfig:
              state.status == AuthenticationStatus.authenticated
                  ? routerPrivate
                  : routerPublic,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff006A6A)),
          ),
        );
      },
    );
  }
}
