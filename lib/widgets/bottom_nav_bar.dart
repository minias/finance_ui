import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_ui/core/providers/nav_provider.dart';
import 'package:finance_ui/core/constants/app_strings.dart'; // 공통 문자열 import

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavProvider>();

    return SafeArea(
      child: SizedBox(
        height: kMinInteractiveDimension, // ✅ 기본 높이 유지
        child: BottomNavigationBar(
          currentIndex: navProvider.currentIndex,
          type: BottomNavigationBarType.fixed, // ✅ 애니메이션 제거
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12, // ✅ 폰트 크기 조정
          unselectedFontSize: 10, // ✅ 비활성 폰트 크기 조정
          enableFeedback: false, // ✅ 클릭 시 진동 제거
          iconSize: 14,
          onTap: (index) {
            navProvider.setCurrentIndex(index);
          },
          items: List.generate(AppStrings.menuTitles.length, (index) {
            final icons = [
              Icons.home,
              Icons.bar_chart,
              Icons.swap_horiz,
              Icons.account_balance_wallet,
              Icons.apps,
            ];
            return BottomNavigationBarItem(
              icon: Icon(icons[index], size: 14),
              label: AppStrings.menuTitles[index], // ✅ 공통 리스트 사용
            );
          }),
        ),
      ),
    );
  }
}
