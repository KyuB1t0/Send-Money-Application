import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:send_money_application/data/logic/session_bloc/session_bloc.dart';
import 'package:send_money_application/features/auth/logic/login_bloc/login_bloc.dart';
import 'package:send_money_application/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final sessionState = SessionState(prefs);
  sessionState.checkLoggedIn();
  sessionState.checkToken(); // ✅ Now token is initialized for the same instance

  runApp(MyApp(loginState: sessionState));
}

class MyApp extends StatefulWidget {
  final SessionState loginState;

  MyApp({super.key, required this.loginState});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        Provider<MyRouter>(
          lazy: false,
          create: ((context) => MyRouter(widget.loginState)),
        ),
      ],
      // child: MaterialApp(
      //   title: 'THE ABBA YTO Lite',
      //   debugShowCheckedModeBanner: false,
      //   onGenerateRoute: AppRoutes.onGenerateRoutes,
      //   navigatorKey: MainApp.navigatorKey,
      //   initialRoute: '/',
      // ),
      child: Builder(
        builder: (context) {
          final router = Provider.of<MyRouter>(context, listen: false).router;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            title: 'Maya Send Money',
          );
        },
      ),
    );
  }
}
