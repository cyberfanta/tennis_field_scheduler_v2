import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/lang/ui_texts.dart';
import 'package:tennis_field_scheduler_v2/app/static_data/static_data.dart';
import 'package:tennis_field_scheduler_v2/data/repository.dart';
import 'package:tennis_field_scheduler_v2/data/sources/local_data/local_data.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_user.dart';
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
import 'package:tennis_field_scheduler_v2/view_test_cubit.dart';

class TestConfiguration {
  final TargetPlatform platform;
  final List<Size> sizes;

  TestConfiguration({required this.platform, required this.sizes});
}

final testConfigurations = [
  TestConfiguration(
    platform: TargetPlatform.android,
    sizes: [
      const Size(340, 740),
      const Size(340, 740),
      const Size(360, 740),
      const Size(360, 780),
      const Size(1080, 1800),
      const Size(1080, 1920),
      const Size(1080, 2340),
      const Size(1284, 2778),
    ],
  ),
  TestConfiguration(
    platform: TargetPlatform.iOS,
    sizes: [
      const Size(320, 480),
      const Size(408, 886),
      const Size(428, 926),
      const Size(1284, 2778),
    ],
  ),
];

class TestWidgetBuilder {
  static Widget build({required Widget child, required Size size}) {
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
            BlocProvider<ViewTestCubit>(
              create: (context) => ViewTestCubit(),
            ),
          ],
          child: child,
        ),
      ),
    );
  }
}

void _runTestsForView(Widget view, List<Size> sizes, TargetPlatform platform) {
  group('View: $view', () {
    for (final size in sizes) {
      testWidgets("Basic Overflow: Size: (${size.width}, ${size.height})",
          (tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1.0;
        debugDefaultTargetPlatformOverride = platform;

        await tester.runAsync(() async {
          var testingView = TestWidgetBuilder.build(child: view, size: size);

          await tester.pumpWidget(
            TestWidgetBuilder.build(child: testingView, size: size),
          );

          expect(find.byWidget(testingView), findsOneWidget);
        });

        tester.view.resetPhysicalSize();
        debugDefaultTargetPlatformOverride = null;
        await tester.pumpAndSettle();
      });
    }
  });
}

class MockLocalData extends Mock implements LocalData {}

class MockRepository extends Mock implements Repository {}

void main() {
  final viewTest = [
    const LoginView(),
    const SignUpView(),
    const BeginView(),
    const ReservationsView(),
    const FavoritesView(),
    const ReserveFullPageView(),
    const WelcomeView(),
  ];

  setUp(() {
    currentUser = BaseUser(
      name: "Julio Leon",
      email: "julioleon2004@gmail.com",
      phone: "04242259220",
      pass: "123",
      remember: false,
    );
  });

  for (final config in testConfigurations) {
    group('Test platform: ${config.platform}', () {
      for (final view in viewTest) {
        _runTestsForView(view, config.sizes, config.platform);
      }
    });
  }
}
