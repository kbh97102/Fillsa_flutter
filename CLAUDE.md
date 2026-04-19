# Fillsa Flutter

기존에 서비스 중인 **필사(Fillsa) 안드로이드 앱**을 Flutter로 이관하는 프로젝트이다.

- Flutter 프로젝트: `/Users/gangbohun/AndroidStudioProjects/fillsa_flutter`
- 원본 Android 프로젝트: `/Users/gangbohun/AndroidStudioProjects/Fillsa` — 스펙/동작의 기준이 모호할 때 참조한다.
- 기획서: [`docs/planning.md`](docs/planning.md) — 추후 업로드 예정.

## 아키텍처

**Clean Architecture + MVI**를 기본 구조로 한다.

```
lib/
├─ domain/        # 비즈니스 규칙 계층 (순수 Dart)
│  ├─ model/          # 도메인 모델 / DTO
│  ├─ repository/     # Repository 추상화 (interface)
│  └─ usecase/        # 단일 책임 UseCase
├─ data/          # 데이터 계층 (네트워크/로컬 I/O)
│  ├─ network/        # Retrofit/Dio 기반 API
│  ├─ local/          # Drift / SharedPreferences
│  ├─ repository/     # domain/repository 구현체
│  └─ util/
└─ presentation/  # UI 계층 (MVI)
   ├─ ui/             # 화면 단위 Widget
   ├─ viewmodels/     # Riverpod 기반 ViewModel (Intent 처리)
   ├─ state/          # freezed 기반 State
   └─ util/
```

### 레이어 규칙 — 반드시 지킬 것

1. **Presentation은 Repository를 직접 참조하지 않는다.**
   다른 레이어와의 상호작용은 **반드시 UseCase를 통해서만** 이루어진다.
   ViewModel에서 `XxxRepository`를 직접 주입/호출하는 코드는 금지.

2. **Domain ↔ Data 모델 공유 예외.**
   원칙적으로 Domain의 모델과 Data의 DTO는 분리되어야 하지만, 이 프로젝트는 **Domain에서 정의한 DTO를 Data에서도 그대로 사용**한다.
   → Domain 모델을 수정할 때 Data 직렬화/역직렬화 영향을 함께 확인해야 한다.
   → Data 레이어에서 별도 DTO를 새로 만들지 말 것. 필요하면 Domain 모델을 확장한다.

3. **의존성 방향**: `presentation → domain ← data`
   Domain은 Flutter/Dio/Drift 등 프레임워크에 의존하지 않는다.

## 기술 스택

- **상태관리 / DI**: `flutter_riverpod` 3.x, `get_it` + `injectable`
- **네트워크**: `dio` + `retrofit`
- **로컬 DB**: `drift` (+ `shared_preferences`)
- **라우팅**: `go_router` + `go_router_builder`
- **모델링**: `freezed`, `json_serializable`
- **인증**: Firebase Auth, Google Sign-In, Kakao SDK

코드 생성이 필요한 경우:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## MVI 작성 규칙

- State는 `freezed`로 정의 (`presentation/state/*.dart`).
- ViewModel은 사용자 Intent를 받아 UseCase 호출 → 결과로 State를 갱신.
- UI는 State를 구독하여 렌더링만 담당.

## 작업 가이드

- 신규 기능 추가 시 순서: **domain/model → domain/repository → data 구현 → domain/usecase → presentation**.
- 새 UseCase는 `base_usecase.dart` 규약을 따른다.
- 새 Repository는 `domain/repository`에 인터페이스를 먼저 정의하고 `data/repository`에 구현한다.
- 기획/UX가 불명확하면 먼저 `docs/planning.md`와 원본 Android 프로젝트 동작을 확인한다.
