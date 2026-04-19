# [Calendar] `3.calendar`

## 기본 동작

- 디폴트: 현재 날짜가 달력에서 선택된 상태로 진입
- 월 이동 시 해당 월 1일이 자동 선택됨
- 2025년 6월 16일 이전 날짜 disable 처리
- 오늘 날짜 이후 월로 이동 불가
- 오늘 날짜 이후 일자 disable 처리

## 달력 영역

- 월별 달력 표시
- 날짜별로 필사(또는 사진) 여부 및 좋아요 여부 아이콘 표시
- 특정 날짜 클릭 시 하단에 해당일 명언 노출

## 하단 명언 영역

- 선택 날짜의 명언 노출
- 클릭 시 해당 날짜의 Home 화면으로 이동

## 하단 통계 영역 (해당 월 필사/좋아요 개수)

### V1

- 클릭 시 List 화면으로 이동
- 백엔드에서 최근 1년 데이터만 조회 (V2 배포 대응)

### V2

- 클릭 시 List 화면으로 이동
- List 화면의 조회 기간이 해당 월(1일 ~ 마지막일)로 자동 셋팅됨
- 조회 기간은 최대 1년 단위만 지정 가능

---

## API

### 월간 명언 조회 (비회원)

```
GET /api/v1/quotes/monthly?yearMonth={yearMonth}
```

**Query Parameter**

| 파라미터 | 형식 | 예시 |
|----------|------|------|
| yearMonth | String | `2025-06` |

**Response: `List<MonthlyQuoteResponse>`**

### 월간 명언 조회 (회원)

```
GET /api/v2/member-quotes/monthly?yearMonth={yearMonth}
```

**Query Parameter**

| 파라미터 | 형식 | 예시 |
|----------|------|------|
| yearMonth | String | `2025-06` |

**Response: `MemberMonthlyQuoteResponse`**
