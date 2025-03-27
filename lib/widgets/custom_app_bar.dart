import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_ui/core/constants/app_strings.dart';
import 'package:finance_ui/core/providers/nav_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavProvider>();
    final currentIndex = navProvider.currentIndex;

    // 각 메뉴에 맞는 액션 아이콘 설정
    List<Widget> getActions(int index) {
      final List<Widget> actions = [];

      // 공통적으로 들어가는 아이콘 설정
      if ([0, 1, 2, 4].contains(index)) {
        actions.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1), // ✅ 좌우 여백 조정
            child: IconButton(
              icon: const Icon(Icons.notifications, size: 16),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('공지 화면으로 이동!')));
              },
            ),
          ),
        );
      }

      // 메뉴별 추가 아이콘 설정
      switch (index) {
        case 0: // 거래소 → 설정 + 공지
        case 3: // 입출금 → 설정 + 공지
          actions.insert(
            0,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: const Icon(Icons.settings, size: 16),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('설정 화면으로 이동!')));
                },
              ),
            ),
          );
          break;
        case 2: // 거래 → 링크 + 공지
          actions.insert(
            0,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: const Icon(Icons.link, size: 16),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('링크 화면으로 이동!')));
                },
              ),
            ),
          );
          break;
        case 4: // 더보기 → 고객센터 + QR 코드
          actions
            ..clear()
            ..addAll([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: IconButton(
                  icon: const Icon(Icons.support_agent, size: 16),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('고객센터 화면으로 이동!')),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: IconButton(
                  icon: const Icon(Icons.qr_code, size: 16),
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('QR 코드 스캔!')));
                  },
                ),
              ),
            ]);
          break;
      }

      return actions;
    }

    return AppBar(
      title: Text(
        AppStrings.menuTitles[currentIndex], // ✅ 공통 리스트 사용
        style: const TextStyle(fontSize: 14),
      ),
      centerTitle: true, // ✅ 제목 가운데 정렬
      backgroundColor: Colors.black,
      foregroundColor: Colors.white, // ✅ 텍스트 및 아이콘 색상
      elevation: 2, // ✅ 그림자 효과 추가
      actions: getActions(currentIndex),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);
}
