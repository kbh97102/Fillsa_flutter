# [마이 페이지] `5.mypage`

## 공통 (비회원 / 회원)

| 항목 | 동작 |
|------|------|
| 공지사항 버튼 | 공지사항 페이지로 이동 |
| 알림 버튼 | 알림 페이지로 이동 |
| 버전 표시 | 현재 앱 버전 노출 |
| 테마 버튼 (V2) | 테마 팝업 노출 (라이트 / 다크 / 시스템) |

## 비회원

- 로그인 버튼 → 로그인 페이지로 이동

## 회원

- 회원 정보 노출: 프로필 사진, 닉네임
- 로그아웃 버튼 → 마이 페이지 리렌더링 (비회원 상태)

---

## API

### 회원 스트릭 조회

```
GET /api/v1/member-streaks
```

**Response: `MemberStreakResponse`**

### 버전 업데이트 팝업 확인

```
GET /api/v1/popups/version-update?currentVersion={currentVersion}
```

**Query Parameter**

| 파라미터 | 기본값 | 설명 |
|----------|--------|------|
| currentVersion | `0.0.2` | 현재 앱 버전 |

**Response: `PopupResponse`**

### 일반 팝업 확인

```
GET /api/v1/popups/general
```

**Response: `PopupResponse`**
