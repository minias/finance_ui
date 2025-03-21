# finance_ui

finance_ui

```sh
finance_ui/
├── lib/
│── core/
│   └── widgets/
│       ├── bottom_nav_bar.dart
│       ├── errors/
│       │   └── exceptions.dart        // 예외 정의, 모든 에러 핸들링 관련
│       ├── common/
│       │   └── logger.dart            // 로그 등 공통 기능
│       └── utils/
│           └── network_checker.dart   // 네트워크 체크 유틸리티 등
│── presentation/
│   ├── home/
│   │   └── home_screen.dart
│   ├── chart/
│   ├── trade/
│   ├── portfolio/
│   ├── settings/
│   ├── features/
│   │   └── finance/
│   │       ├── data/
│   │       │   ├── datasources/
│   │       │   │   └── finance_remote_data_source.dart  // 원격 데이터 소스
│   │       │   ├── models/
│   │       │   │   └── finance_model.dart                 // 데이터 모델
│   │       │   └── repositories/
│   │       │       └── finance_repository_impl.dart       // Repository 구현체
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── finance.dart                       // 도메인 엔티티
│   │       │   ├── repositories/
│   │       │   │   └── finance_repository.dart            // Repository 인터페이스
│   │       │   └── usecases/
│   │       │       └── get_finance_info.dart              // UseCase 예시
│   │       └── presentation/
│   │           ├── pages/
│   │           │   └── finance_page.dart                  // UI 페이지
│   │           └── widgets/
│   │               └── finance_card.dart                // 공통 위젯 예시
│   └── main.dart                                        // 앱 진입점
├── test/
│   ├── core/
│   │   └── common/
│   │       └── logger_test.dart                         // 공통 모듈 테스트
│   └── features/
│       └── finance/
│           ├── data/
│           │   └── finance_repository_impl_test.dart    // 데이터 레이어 테스트
│           ├── domain/
│           │   └── usecases/
│           │       └── get_finance_info_test.dart         // 유스케이스 테스트
│           └── presentation/
│               └── finance_page_test.dart               // UI 테스트
└── pubspec.yaml
```
