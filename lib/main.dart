import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/backgrounds/error_message_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_dropdown/custom_dropdown_data_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_dropdown/custom_dropdown_open_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/menu/menu_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/full_page_view/reserve_full_page_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/begin_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/favorites_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/initial_views/welcome_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/reservations_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/login_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/signup_view.dart';

import 'app/lang/ui_texts.dart';
import 'domain/use_cases/full_page_view/reserve_full_page_view_cubit.dart';
import 'domain/use_cases/login_views/login_view_cubit.dart';
import 'domain/use_cases/login_views/signup_view_cubit.dart';

void main() {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UiTexts(const Locale('es')),
          ),
          BlocProvider<MenuCubit>(
            create: (context) => MenuCubit(),
          ),
          BlocProvider<ErrorMessageCubit>(
            create: (context) => ErrorMessageCubit(),
          ),
          BlocProvider<LoginViewCubit>(
            create: (context) => LoginViewCubit(),
          ),
          BlocProvider<SignUpViewCubit>(
            create: (context) => SignUpViewCubit(),
          ),
          BlocProvider<CustomDropdownOpenCubit>(
            create: (context) => CustomDropdownOpenCubit(),
          ),
          BlocProvider<CustomDropdownDataCubit>(
            create: (context) => CustomDropdownDataCubit(),
          ),
          BlocProvider<ReserveFullPageViewCubit>(
            create: (context) => ReserveFullPageViewCubit(),
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
      initialRoute: WelcomeView.routeName,
      routes: {
        WelcomeView.routeName: (context) => const WelcomeView(),

        LoginView.routeName: (context) => const LoginView(),
        SignUpView.routeName: (context) => const SignUpView(),

        BeginView.routeName: (context) => const BeginView(),
        ReservationsView.routeName: (context) => const ReservationsView(),
        FavoritesView.routeName: (context) => const FavoritesView(),

        ReserveFullPageView.routeName: (context) => const ReserveFullPageView(),
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
