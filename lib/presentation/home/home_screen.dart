import 'package:finance_ui/widgets/bottom_nav_bar.dart';
import 'package:finance_ui/widgets/custom_app_bar.dart';
import 'package:finance_ui/widgets/fixed_notice_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_ui/core/providers/nav_provider.dart';
import 'package:finance_ui/core/providers/notice_provider.dart';

import 'package:finance_ui/screens/exchange_screen.dart';
import 'package:finance_ui/screens/chart_screen.dart';
import 'package:finance_ui/screens/trade_screen.dart';
import 'package:finance_ui/screens/deposit_screen.dart';
import 'package:finance_ui/screens/more_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavProvider>();
    final noticeProvider = context.watch<NoticeProvider>(); // ✅ 공지 상태 가져오기

    // 현재 선택된 화면
    final List<Widget> screens = [
      const ExchangeScreen(),
      const ChartScreen(),
      const TradeScreen(),
      const DepositScreen(),
      const MoreScreen(),
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: screens[navProvider.currentIndex], // ✅ 선택된 화면
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min, // ✅ 최소 크기로 설정
        children: const [
          FixedNoticeBar(), // ✅ 공지 바 추가
          BottomNavBar(), // ✅ 기존 네비게이션 바
        ],
      ),
    );
  }
}
