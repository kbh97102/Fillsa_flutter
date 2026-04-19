# [공지사항] `5-1.notice`

## V1 — `5-1.notice_non`

- 빈 화면 조회 (공지사항 없음 상태)

## V2 — `5-1.notice`

- 공지사항 목록 조회
  - 노출 정보: 날짜, 내용
  - 정렬: 날짜 내림차순
  - 스크롤 페이징

- 공지사항 항목 클릭 시 상세 페이지 이동 `5-1.notice_detail`

### 공지사항 상세 `5-1.notice_detail`

- 노출 정보: 제목, 날짜, 내용
- 뒤로가기 버튼으로 목록 화면으로 이동

---

## API

### 공지사항 목록 조회 (페이징)

```
GET /api/v1/notices?size=30&page={page}
```

**Query Parameters**

| 파라미터 | 타입 | 설명 |
|----------|------|------|
| size | Int | 고정값 30 |
| page | Int | 0부터 시작 |

**Response: `PageResponseNoticeResponse`**

- 인증 불필요 (NoToken API)
- 데이터 없으면 빈 목록 반환
