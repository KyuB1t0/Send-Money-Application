import 'package:go_router/go_router.dart';
import 'package:send_money_application/data/logic/session_bloc/session_bloc.dart';
import 'package:send_money_application/features/auth/presentation/login_screen.dart';
import 'package:send_money_application/features/send_money/presentation/send_money_screen.dart';
import 'package:send_money_application/features/transactions/presentation/transactions_screen.dart';
import 'package:send_money_application/features/wallet/presentation/wallet_screen.dart';

class MyRouter {
  final SessionState loginInfo;
  String initial = '/';
  MyRouter(this.loginInfo);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: loginInfo.token.isNotEmpty ? '/' : '/login',
    refreshListenable: loginInfo,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(key: state.pageKey, child: LoginScreen());
        },
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return NoTransitionPage(key: state.pageKey, child: LoginScreen());
        },
      ),
      GoRoute(
        path: '/wallet',
        pageBuilder: (context, state) {
          final extra = state.extra;
          final extraMap = extra is Map<String, dynamic> ? extra : {};

          final username = extraMap['username'] ?? '';
          return NoTransitionPage(
            key: state.pageKey,
            child: WalletScreen(username: username),
          );
        },
      ),

      GoRoute(
        path: '/send-money',
        pageBuilder: (context, state) {
          final extra = state.extra;
          final extraMap = extra is Map<String, dynamic> ? extra : {};

          final username = extraMap['username'] ?? '';
          return NoTransitionPage(
            key: state.pageKey,
            child: SendMoneyScreen(username: username),
          );
        },
      ),

      GoRoute(
        path: '/transactions',
        pageBuilder: (context, state) {
          final extra = state.extra;
          final extraMap = extra is Map<String, dynamic> ? extra : {};

          final username = extraMap['username'] ?? '';
          return NoTransitionPage(
            key: state.pageKey,
            child: TransactionsScreen(username: username),
          );
        },
      ),
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
