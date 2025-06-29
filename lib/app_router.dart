import 'package:first_app/src/features/chats/chat_screen.dart';
import 'package:first_app/src/features/home/home_screen.dart';
import 'package:first_app/src/features/payment/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home/chats',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: '/home/chats',
          builder: (context, state) => ChatSection()
        ),
        GoRoute(
          path: '/home/status',
          builder: (context, state) => Text("Status Screen")
        ),
        GoRoute(
          path: '/home/community',
          builder: (context, state) => Text("Community Screen")
        ),
        GoRoute(
          path: '/home/calls',
          builder: (context, state) => Text("Calls Screen")
        ),

      ]
    ),
    GoRoute(
      path: "/payments",
      builder: (context, state) => PaymentScreen()
    )
  ]
);