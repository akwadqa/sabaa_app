import 'package:flutter/material.dart';
import 'package:sabaa/features/customers/presentation/screens/customers_page.dart';
import 'package:sabaa/features/home/presentation/screens/home_screen.dart';
import 'package:sabaa/features/main/presentation/widgets/bottom_nav_item.dart';
import 'package:sabaa/features/van_stock/presentation/screens/van_stock_page.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

// Placeholder pages for other tabs
class _RoutePage extends StatelessWidget {
  const _RoutePage();
  @override
  Widget build(BuildContext context) => const Center(child: Text('Route'));
}

class _CustomersPage extends StatelessWidget {
  const _CustomersPage();
  @override
  Widget build(BuildContext context) => const Center(child: Text('Customers'));
}

class _StockPage extends StatelessWidget {
  const _StockPage();
  @override
  Widget build(BuildContext context) => const Center(child: Text('Stock'));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const List<NavDestination> _destinations = [
    NavDestination(
      label: 'nav_home',
      icon: Icons.home_outlined,
      page: HomeScreen(),
    ),
    NavDestination(
      label: 'nav_route',
      icon: Icons.map_outlined,
      page: _RoutePage(),
    ),
    NavDestination(
      label: 'nav_customers',
      icon: Icons.people_outline,
      page: CustomersPage(),
    ),
    NavDestination(
      label: 'nav_stock',
      icon: Icons.inventory_outlined,
      page: VanStockPage(),
    ),
  ];

  void _onNavTap(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: _BottomNavBar(
        destinations: _destinations,
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
      body: IndexedStack(
        index: _currentIndex,
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
