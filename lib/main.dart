import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/backgrounds/error_message_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/menu/menu_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_view/begin_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_view/favorites_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/initial_view/landing_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_view/reservations_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_view/login_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_view/signup_view.dart';

import 'app/lang/ui_texts.dart';

void main() {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UiTexts(const Locale('en')),
          ),
          BlocProvider<MenuCubit>(
            create: (context) => MenuCubit(),
          ),
          BlocProvider<ErrorMessageCubit>(
            create: (context) => ErrorMessageCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingView.routeName,
      routes: {
        LandingView.routeName: (context) => const LandingView(),

        LoginView.routeName: (context) => const LoginView(),
        SignUpView.routeName: (context) => const SignUpView(),

        BeginView.routeName: (context) => const BeginView(),
        ReservationsView.routeName: (context) => const ReservationsView(),
        FavoritesView.routeName: (context) => const FavoritesView(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
    );
  }
}
