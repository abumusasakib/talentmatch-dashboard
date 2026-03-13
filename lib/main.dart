import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/router.dart';
import 'core/di/injection_container.dart' as di;
import 'features/dashboard/presentation/cubit/dashboard_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const TalentMatchApp());
}

class TalentMatchApp extends StatelessWidget {
  const TalentMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<DashboardCubit>()..loadData(),
      child: MaterialApp.router(
        title: 'TalentMatch AI Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF38BDF8),
          scaffoldBackgroundColor: const Color(0xFF0F172A),
          textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
