import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // Khám phá
    const _SimpleScreen(
      icon: Icons.history,
      title: 'Lịch sử',
      subtitle: 'Tính năng đang được phát triển',
    ), // Lịch sử
    const _SimpleScreen(
      icon: Icons.smart_toy,
      title: 'AI Chat',
      subtitle: 'Trò chuyện với AI y tế',
      iconColor: Colors.red,
      titleColor: Colors.red,
    ), // AI Chat
    const _SimpleScreen(
      icon: Icons.notifications,
      title: 'Thông báo',
      subtitle: 'Chưa có thông báo mới',
    ), // Thông báo
    const _SimpleScreen(
      icon: Icons.person,
      title: 'Tài khoản',
      subtitle: 'Quản lý thông tin cá nhân',
    ), // Tài khoản
  ];

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}

class _SimpleScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final Color? titleColor;

  const _SimpleScreen({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 64, color: iconColor ?? Colors.grey),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: titleColor ?? Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}