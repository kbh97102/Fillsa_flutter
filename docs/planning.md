# Fillsa 기획서

필사(Fillsa) 앱의 전체 기획 문서.  
화면별 상세 기획은 `docs/screens/` 하위 파일에서 관리한다.

---

## 주요 기능 목록

| # | 기능명 | 설명 |
|---|--------|------|
| 1 | 필사 사진 업로드 | 종이에 필사한 내용을 사진으로 업로드 가능 |
| 2 | 타이핑 필사 | 사용자가 직접 명언을 따라 타이핑 가능 |
| 3 | 명언 제공 | 하루 한 문장씩 명언 제공 (랜덤 or 주제별) |
| 4 | 위젯 제공 | 앱 외 다른 화면에 명언 자동 표시 (잠금화면, 알림바 등) |
| 5 | 기록 저장 | 필사한 내용을 모아볼 수 있는 다이어리 기능 |
| 6 | 달력 요약 기능 | 필사한 내용을 달력 형태로 제공하여 한 달 단위로 기록 요약 |
| 7 | 명언 즐겨찾기 | 좋아하는 명언을 즐겨찾기로 저장하고 나중에 다시 확인 |
| 8 | 명언 언어별 제공 | 명언을 언어별로 제공 (한국어, 영어 등) |
| 9 | 명언 사진 저장 | 명언을 다양한 사이즈의 이미지 파일로 저장하여 사진 앱에 저장 |
| 10 | 명언 저자 정보 제공 | 저자에 대한 위키백과 링크 제공 |
| 11 | SNS 공유 | 필사한 내용을 SNS (인스타그램, 카카오톡 등) 공유 가능 |
| 12 | 푸시 알림 | 매일 필사를 독려하는 알림 제공 |
| 13 | 간편 로그인 | 구글, 카카오톡 간편 로그인 기능 제공 |
| 14 | 필사 감상평 | 필사 후 감상평을 추가하여 기록에 저장 |

---

## 화면별 기획 문서

> 각 화면의 상세 기획(기능 명세, API, 상태 정의)은 아래 파일에서 관리한다.

| 파일 | 화면 |
|------|------|
| [common.md](screens/common.md) | 공통 UI (헤더, 하단 바, 광고 영역) |
| [0_onboarding.md](screens/0_onboarding.md) | 랜딩 페이지 (알림 허용) |
| [0_onboarding_guide.md](screens/0_onboarding_guide.md) | 가이드 페이지 |
| [1_login.md](screens/1_login.md) | 온보딩 / 로그인 |
| [2_home.md](screens/2_home.md) | Home (명언, 타이핑, 사진, 공유) |
| [3_calendar.md](screens/3_calendar.md) | Calendar |
| [4_list.md](screens/4_list.md) | List (목록, 상세, 메모) |
| [5_mypage.md](screens/5_mypage.md) | My Page |
| [5_1_notice.md](screens/5_1_notice.md) | 공지사항 |
| [5_2_inform.md](screens/5_2_inform.md) | 알림 설정 / 회원 탈퇴 |
| [5_3_theme.md](screens/5_3_theme.md) | 테마 (V2) |

---

## API 문서

- [api_overview.md](api_overview.md) — 전체 API 목록 (endpoint, 인증 구분, 화면 연결)

---

## 참고

- 기능 스펙/화면 정의가 불명확한 경우 원본 Android 프로젝트
  (`/Users/gangbohun/AndroidStudioProjects/Fillsa`)의 동작을 기준으로 삼는다.
