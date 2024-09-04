import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/lang/ui_texts.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/full_page_view/reserve_full_page_view_cubit.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/login_views/login_view_cubit.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/login_views/signup_view_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/backgrounds/error_message_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_dropdown/custom_dropdown_data_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_dropdown/custom_dropdown_open_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/menu/menu_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/full_page_view/reserve_full_page_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/initial_views/welcome_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/begin_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/favorites_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/reservations_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/login_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/signup_view.dart';

void main() {
  final targetPlatformTest = [
    TargetPlatform.android,
    TargetPlatform.iOS,
  ];

  final sizesTest = [
    [
      const Size(340, 740),
      const Size(360, 740),
      const Size(360, 780),
      const Size(1080, 1800),
      const Size(1080, 1920),
      const Size(1080, 2340),
      const Size(1284, 2778),
    ],
    [
      const Size(320, 480),
      const Size(408, 886),
      const Size(428, 926),
      const Size(1284, 2778),
    ],
  ];

  final viewTest = [
    const WelcomeView(),
    const LoginView(),
    const SignUpView(),
    const BeginView(),
    const ReservationsView(),
    const FavoritesView(),
    const ReserveFullPageView(),
  ];

  Widget makeTestWidget({required Widget child, required Size size}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: size),
        child: MultiProvider(
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
          child: child,
        ),
      ),
    );
  }

  for (var i = 0; i < targetPlatformTest.length; i++) {
    group('Test platform: ${targetPlatformTest[i]}', () {
      final sizes = sizesTest[i];
      final platform = targetPlatformTest[i];

      for (final view in viewTest) {
        group('View: $view', () {
          for (final size in sizes) {
            testWidgets("Basic Overflow: Size: (${size.width}, ${size.height})",
                (tester) async {
              final TestWidgetsFlutterBinding binding =
                  TestWidgetsFlutterBinding.ensureInitialized();

              binding.window.physicalSizeTestValue = size;
              binding.window.devicePixelRatioTestValue = 1.0;

              debugDefaultTargetPlatformOverride = platform;

              await tester.runAsync(() async {
                await tester
                    .pumpWidget(makeTestWidget(child: view, size: size));

                expect(tester.takeException(), isNull);
              });

              await tester.pumpAndSettle();
            });
          }
        });
      }
    });
  }
}
