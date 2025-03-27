import 'package:finance_ui/core/providers/notice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finance_ui/presentation/home/home_screen.dart';
import 'package:finance_ui/core/providers/nav_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavProvider()),
        ChangeNotifierProvider(
          create: (_) => NoticeProvider(),
        ), // ✅ 공지 Provider 추가
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0, // 그림자 제거
          selectedIconTheme: IconThemeData(size: 16),
          unselectedIconTheme: IconThemeData(size: 12),
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.blueAccent,
          surface: Colors.transparent, // 터치 애니메이션 제거
          onSurface: Colors.transparent, // 터치 애니메이션 제거
        ),
      ),
      //테마를 다른곳에서 임포트하면 문제가 발생한다.
      darkTheme: ThemeData.dark().copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0, // 그림자 제거
          backgroundColor: Color.fromARGB(255, 12, 39, 85),
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 16),
          unselectedIconTheme: IconThemeData(size: 12),
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.blueAccent,
          surface: Colors.transparent, // 터치 애니메이션 제거
          onSurface: Colors.transparent, // 터치 애니메이션 제거
        ),
      ),
      themeMode: ThemeMode.system, // 시스템 설정에 따라 다크/라이트 모드 적용
      home: const HomeScreen(),
    );
  }
}
