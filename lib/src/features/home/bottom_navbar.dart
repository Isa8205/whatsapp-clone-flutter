import 'package:first_app/src/core/utils/is_under_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

// Classes for types
class NavItem {
  final IconData icon;
  final String route;
  final String label;

  const NavItem({
    required this.icon,
    required this.route,
    required this.label,
});
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String activeTab = "home";

  final List<NavItem> navItems = [
    NavItem(icon: LucideIcons.message_circle, route: "/chats", label: "Chats"),
    NavItem(icon: LucideIcons.message_circle_dashed, route: "/status", label: "Status"),
    NavItem(icon: LucideIcons.users_round, route: "/community", label: "Community"),
    NavItem(icon: LucideIcons.phone, route: "/calls", label: "Calls")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var item in navItems)
              Builder(builder: (context) {
                bool isActive = GoRouterState.of(context).uri.toString() == '/home${item.route}';
                return InkWell(
                  onTap: () => context.push('/home${item.route}'),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.greenAccent.withAlpha(50) : Colors.transparent,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(item.icon,)
                      ),
                      SizedBox(height: 5,),
                      Text(
                        item.label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                );
              })
          ],
        ),
    );
  }
}