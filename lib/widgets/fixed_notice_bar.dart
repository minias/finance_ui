import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_ui/core/providers/notice_provider.dart';

class FixedNoticeBar extends StatelessWidget {
  const FixedNoticeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final noticeProvider = context.watch<NoticeProvider>();

    if (noticeProvider.notice.isEmpty)
      return const SizedBox.shrink(); // 공지가 없으면 숨김

    return Container(
      color: Colors.blueAccent, // ✅ 배경색 지정
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ), // ✅ 패딩 최소화
      height: 24, // ✅ 고정 높이 설정 (더 낮게)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              noticeProvider.notice,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ), // ✅ 폰트 크기 축소
              overflow: TextOverflow.ellipsis, // 긴 텍스트 줄임 처리
              maxLines: 1, // ✅ 한 줄만 표시
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 14,
            ), // ✅ 아이콘 크기 축소
            padding: EdgeInsets.zero, // ✅ 버튼 크기 최소화
            constraints: const BoxConstraints(), // ✅ 불필요한 공간 제거
            onPressed: () {
              noticeProvider.clearNotice(); // ✅ X 버튼 클릭 시 공지 삭제
            },
          ),
        ],
      ),
    );
  }
}
