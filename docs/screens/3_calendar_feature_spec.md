# [Calendar] 기능 명세 (Flutter 구현용)

> 기획서(`3_calendar.md`), 원본 Android CalendarView/Section/ViewModel, CalendarAction을 종합 정리.

---

## 1. 화면 구성

```
┌──────────────────────────────────────┐
│ [상단 헤더]  Fillsa 로고 / 🔥100일 / 👤 │
├──────────────────────────────────────┤
│                                      │
│  ┌────────────────────────────────┐  │
│  │  < 2025. 03 >                  │  │
│  │  일  월  화  수  목  금  토     │  │
│  │  27  28  29  30  31   1   2   │  │
│  │  ...                           │  │
│  │  각 날짜 셀 → 아이콘 최대 3개   │  │
│  └────────────────────────────────┘  │
│                                      │
│               📓 3  ❤️ 2  🔥 2        │  ← CalendarCountSection
│                                      │
│  ┌────────────────────────────────┐  │
│  │ 21    글자수 제한 몇자 정도가   │  │  ← CalendarQuoteSection
│  │ (목)  좋을까요? ...            │  │
│  └────────────────────────────────┘  │
│                                      │
│ [하단 광고 배너]                      │
└──────────────────────────────────────┘
```

---

## 2. 진입 조건 및 날짜 제한

| 항목 | 내용 |
|------|------|
| 디폴트 선택 날짜 | 현재 날짜 (오늘) |
| 시작 날짜 | **2025년 6월 16일** (이전 날짜 disable) |
| 종료 날짜 | **오늘** (이후 날짜 disable, 이후 월 이동 불가) |
| 월 이동 시 | 이동한 월의 **1일**이 자동 선택됨 |

---

## 3. CalendarSection (달력 영역)

### 3-1. 헤더 (SimpleCalendarTitle)
- 형식: `yyyy. MM` (예: `2025. 03`)
- 색상: 퍼플 (`purple01`)
- 왼쪽 `<` 버튼: 시작월(2025.06)보다 이전이면 숨김
- 오른쪽 `>` 버튼: 현재월이면 숨김

### 3-2. 요일 행 (MonthHeader)
- 일 월 화 수 목 금 토 (일요일 시작)

### 3-3. 날짜 셀 (Day)

**날짜 숫자**
- 현재 월 날짜 & 활성 범위: 일반 텍스트 색상
- 선택된 날짜: 퍼플 배경 + 흰 텍스트
- 이전/다음 월 날짜 & 비활성 범위: 회색 (클릭 불가)

**아이콘 (날짜 숫자 아래, 최대 3개)**

| 아이콘 | 조건 | 위치 |
|--------|------|------|
| 📓 노트 | `completed == true` (타이핑/사진 완료) | Row 1 첫 번째 |
| ❤️ 하트 | `likeYn == Y` | Row 1 두 번째 |
| 🔥 불꽃 | `todayCompleted == true` (오늘 스트릭) | Row 2 |

→ 아이콘이 없을 때는 `opacity 0`으로 자리만 차지 (레이아웃 고정)

---

## 4. CalendarCountSection (월별 통계)

- 화면 우측 정렬
- `📓 N  ❤️ N  🔥 N` 형태
- 클릭 시 → **List 화면으로 이동** (해당 월 조회 기간 자동 설정 — V2)

| 카운트 | 데이터 출처 |
|--------|-----------|
| 📓 타이핑 수 | `monthlySummary.typingCount` |
| ❤️ 좋아요 수 | `monthlySummary.likeCount` |
| 🔥 스트릭 수 | `monthlySummary.streakCount` |

---

## 5. CalendarQuoteSection (하단 명언 카드)

- 선택된 날짜의 명언 표시
- 흰 배경 + 라운드 카드
- 왼쪽: 날짜(DD, 퍼플) + 요일((목), 퍼플)
- 오른쪽: 명언 텍스트 최대 3줄, 초과 시 `...` 처리
- **클릭 시 → Home 화면으로 이동** (해당 날짜의 명언 화면)

---

## 6. 액션 목록 (CalendarAction → Flutter Intent)

| 액션 | 트리거 | 처리 |
|------|--------|------|
| `ChangeMonth(yearMonth)` | 달력 월 이동 | API 재조회 + 선택 날짜 → 해당 월 1일로 변경 |
| `SelectDay(day)` | 날짜 셀 클릭 | 선택 날짜 업데이트 + 하단 명언 갱신 |
| `ClickBottomQuote` | 하단 명언 카드 클릭 | Home 화면으로 이동 (targetYear/Month/Day 전달) |
| `ClickCount` | 통계 영역 클릭 | List 화면으로 이동 (해당 월 yearMonth 전달) |

---

## 7. API

### 회원 (로그인 상태)
```
GET /api/v2/member-quotes/monthly?yearMonth=2025-06
```
Response: `MemberMonthlyQuoteResponse`
- `memberQuotes: List<MemberQuotesData>`
- `monthlySummary: MonthlySummaryData { typingCount, likeCount, streakCount }`

### 비회원
```
GET /api/v1/quotes/monthly?yearMonth=2025-06
```
Response: `List<MonthlyQuoteResponse>`

비회원은 로컬 DB와 머지하여 `MemberMonthlyQuoteResponse`와 동일한 형태로 가공:
- `completed` = 로컬 DB에 korTyping 또는 engTyping이 존재
- `likeYn` = 로컬 DB `likeYn` 값
- `todayCompleted` = completed와 동일
- `monthlySummary.streakCount` = 로컬 DB 스트릭 날짜 수

---

## 8. State 구조 (freezed)

```dart
// presentation/state/calendar_state.dart
@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(null) MemberMonthlyQuoteResponse? monthlyData,
    required DateTime selectedDay,
    @Default('') String selectedDayQuote,
    @Default(false) bool isLoading,
  }) = _CalendarState;
}
```

---

## 9. ViewModel 주요 로직

```
초기화 (Refresh):
  └─ 현재 월 API 호출
  └─ memberQuotes 로드 완료 시 → SelectDay(오늘) 재처리

ChangeMonth:
  └─ refreshData(newYearMonth)
  └─ selectedDay ← 해당 월 1일

SelectDay:
  └─ memberQuotes에서 해당 날짜 quote 검색 → selectedDayQuote 업데이트
  └─ selectedDay 업데이트

ClickBottomQuote:
  └─ Navigate → Home(year, month, day)

ClickCount:
  └─ Navigate → List(yearMonth)
```

---

## 10. 구현 순서

1. `domain/model/` — `MemberMonthlyQuoteResponse`, `MemberQuotesData`, `MonthlySummaryData` 모델
2. `domain/repository/` — `CalendarRepository` 인터페이스
3. `data/network/` — API 엔드포인트 정의
4. `data/repository/` — `CalendarRepositoryImpl` (회원/비회원 분기 + 로컬 DB 머지)
5. `domain/usecase/` — `GetMonthlyQuotesUseCase`, `GetMonthlyQuotesNonMemberUseCase`
6. `presentation/state/` — `CalendarState` (freezed)
7. `presentation/viewmodels/` — `CalendarViewModel` (Riverpod)
8. `presentation/ui/calendar/` — UI 위젯들
   - `CalendarScreen` (진입점)
   - `CalendarSection` (달력, table_calendar 또는 custom)
   - `CalendarCountSection`
   - `CalendarQuoteSection`
