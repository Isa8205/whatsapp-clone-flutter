import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool isUnderRoute(BuildContext context, String baseRoute) {
  final currentLocation = GoRouterState.of(context).uri.toString();
  // Ensure trailing slash for consistent matching
  final normalizedParent = baseRoute.endsWith('/') ? baseRoute : '$baseRoute/';

  return currentLocation.startsWith(normalizedParent);
}