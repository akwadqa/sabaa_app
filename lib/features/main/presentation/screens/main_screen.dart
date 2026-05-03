import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sabaa/features/customers/presentation/screens/customers_page.dart';
import 'package:sabaa/features/home/presentation/screens/home_screen.dart';
import 'package:sabaa/features/main/presentation/widgets/bottom_nav_item.dart';
import 'package:sabaa/features/my_trips/presentation/screens/my_route_page.dart';
import 'package:sabaa/features/van_stock/presentation/screens/van_stock_page.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  static const List<NavDestination> _destinations = [
    NavDestination(
      label: 'nav_home',
      icon: Icons.home_outlined,
      page: HomeScreen(),
    ),
    NavDestination(
      label: 'trips',
      icon: Icons.map_outlined,
      page: MyRoutePage(),
    ),
    NavDestination(
      label: 'nav_customers',
      icon: Icons.people_outline,
      page: CustomersPage(),
    ),
    NavDestination(
      label: 'nav_stock',
      icon: Icons.inventory_2_outlined,
      page: VanStockPage(),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: _BottomNavBar(
        destinations: _destinations,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _destinations.map((d) => d.page).toList(),
      ),
    );
  }
}
// ─────────────────────────────────────────────
// Bottom nav bar widget (private to this file)
// ─────────────────────────────────────────────

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.destinations,
    required this.currentIndex,
    required this.onTap,
  });

  final List<NavDestination> destinations;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.navBorder),
        ),
      ),
      child: Row(
        children: List.generate(destinations.length, (i) {
          final dest = destinations[i];
          return BottomNavItem(
            icon: dest.icon,
            label: dest.label,
            isActive: i == currentIndex,
            onTap: () => onTap(i),
          );
        }),
      ),
    );
  }
}
