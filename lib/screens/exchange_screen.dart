import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_ui/core/providers/notice_provider.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // ✅ 중앙 정렬
      children: [
        const Center(
          child: Text(
            '홈 화면',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20), // ✅ 간격 추가
        ElevatedButton(
          onPressed: () {
            context.read<NoticeProvider>().updateNotice("🚀 새로운 업데이트가 있습니다!");
          },
          child: const Text("공지 변경"),
        ),
      ],
    );
  }
}
