# [List] `4.list`

## 검색 조건

### V1

- 좋아요 여부 체크박스
  - 기본값: 미체크
  - 미체크: 좋아요 여부 무관하게 전체 조회
  - 체크: 좋아요한 문장만 조회

### V2 (V1 포함)

- 조회 기간 지정 가능
  - 기본값 (2025년 기준): 2025.06.01 ~ 현재 날짜
  - 기본값 (2026년 이후): 최근 6개월
  - 최대 1년까지만 지정 가능
  - 오늘 날짜 이후 disable 처리
  - 오늘 날짜 이후 월로 이동 불가

## 목록

- 정렬 기준: 날짜 내림차순
- 필사(또는 사진) 혹은 좋아요한 문장 목록 표시
- 항목별 노출 정보:
  - 명언 일자
  - 명언
  - 메모 여부
  - 좋아요 여부
  - 업로드 사진
- 메모가 존재하는 항목: 좌우 슬라이드로 명언 ↔ 메모 전환

---

## 상세 화면 `4.list_detail`

- 노출 정보: 이미지 / 명언 및 저자 / 메모
- 명언: 국문/영문 모두 조회
- 저자 클릭 시 위키백과 URL로 이동
- 뒤로가기 버튼으로 목록 화면으로 이동

### 메모 영역 클릭 시 → 메모 작성 화면 `4-1.memo`

- 상단: 명언 노출 + 그 아래 메모 입력 영역
- 하단 내비게이션 바 및 광고 영역 숨김
- OS 자판 표시

| 버튼 | 동작 |
|------|------|
| 나가기 | 이전 화면으로 이동 |

---

## API

### 명언 목록 조회 (페이징)

```
GET /api/v2/member-quotes?size=30&page={page}&likeYn={likeYn}&startDate={startDate}&endDate={endDate}
```

**Query Parameters**

| 파라미터 | 타입 | 설명 |
|----------|------|------|
| size | Int | 고정값 30 |
| page | Int | 0부터 시작 |
| likeYn | String | 좋아요 필터 (`Y` / `N` / 전체) |
| startDate | String | 조회 시작 날짜 |
| endDate | String | 조회 종료 날짜 |

**Response: `PageResponseMemberQuotesResponse`**

- 페이징: `totalPages`, `currentPage` 기반으로 마지막 페이지 감지

### 메모 저장

```
POST /api/v1/member-quotes/{memberQuoteSeq}/memo
```

**Path Parameter:** `memberQuoteSeq` (String)  
**Request Body: `MemoRequest`**  
**Response: `Int`**
