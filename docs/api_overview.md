# API 전체 목록

원본 Android 프로젝트 `com.arakene.data.repository` 기준으로 정리.

---

## 인증 구분

| 구분 | 설명 |
|------|------|
| NoToken | 인증 불필요 (`FillsaNoTokenApi`) |
| Token | Bearer 토큰 필요 (`FillsaApi`) |
| TokenApi | 토큰 갱신 전용 (`TokenApi`) |

401/403 수신 시 `POST /api/v1/auth/refresh`로 자동 토큰 갱신 후 재시도.

---

## 인증

| Method | Endpoint | 인증 | 설명 | 관련 화면 |
|--------|----------|------|------|-----------|
| POST | `/api/v1/auth/login` | NoToken | 소셜 로그인 | [1_login](screens/1_login.md) |
| POST | `/api/v1/auth/refresh` | TokenApi | 토큰 갱신 (자동) | — |
| DELETE | `/api/v1/auth/withdraw` | Token | 회원 탈퇴 | [5_2_inform](screens/5_2_inform.md) |

## 명언

| Method | Endpoint | 인증 | 설명 | 관련 화면 |
|--------|----------|------|------|-----------|
| GET | `/api/v1/quotes/daily?quoteDate=` | NoToken | 일일 명언 (비회원) | [2_home](screens/2_home.md) |
| GET | `/api/v1/member-quotes/daily?quoteDate=` | Token | 일일 명언 (회원) | [2_home](screens/2_home.md) |
| GET | `/api/v1/quotes/monthly?yearMonth=` | NoToken | 월간 명언 (비회원) | [3_calendar](screens/3_calendar.md) |
| GET | `/api/v2/member-quotes/monthly?yearMonth=` | Token | 월간 명언 (회원) | [3_calendar](screens/3_calendar.md) |
| GET | `/api/v2/member-quotes` | Token | 명언 목록 페이징 | [4_list](screens/4_list.md) |

## 명언 인터랙션

| Method | Endpoint | 인증 | 설명 | 관련 화면 |
|--------|----------|------|------|-----------|
| POST | `/api/v1/member-quotes/{dailyQuoteSeq}/like` | Token | 좋아요 | [2_home](screens/2_home.md) |
| POST | `/api/v1/member-quotes/{dailyQuoteSeq}/images` | Token | 이미지 업로드 (multipart) | [2_home](screens/2_home.md) |
| DELETE | `/api/v1/member-quotes/{dailyQuoteSeq}/images` | Token | 이미지 삭제 | [2_home](screens/2_home.md) |
| POST | `/api/v1/member-quotes/{dailyQuoteSeq}/typing` | Token | 타이핑 저장 | [2_home](screens/2_home.md) |
| GET | `/api/v1/member-quotes/{dailyQuoteSeq}/typing` | Token | 타이핑 조회 | [2_home](screens/2_home.md) |
| POST | `/api/v1/member-quotes/{memberQuoteSeq}/memo` | Token | 메모 저장 | [4_list](screens/4_list.md) |

## 기타

| Method | Endpoint | 인증 | 설명 | 관련 화면 |
|--------|----------|------|------|-----------|
| GET | `/api/v1/member-streaks` | NoToken | 회원 스트릭 조회 | [5_mypage](screens/5_mypage.md) |
| GET | `/api/v1/notices?size=30&page=` | NoToken | 공지사항 페이징 | [5_1_notice](screens/5_1_notice.md) |
| GET | `/api/v1/popups/general` | NoToken | 일반 팝업 | [5_mypage](screens/5_mypage.md) |
| GET | `/api/v1/popups/version-update?currentVersion=` | NoToken | 버전 업데이트 팝업 | [5_mypage](screens/5_mypage.md) |

---

## 로컬 저장소 (DataStore + Room DB)

| 키 | 설명 |
|----|------|
| `ACCESS_TOKEN` | 액세스 토큰 |
| `REFRESH_TOKEN` | 리프레시 토큰 |
| `DARK_MODE_TYPE` | 다크모드 설정 |
| `SHARE_DESCRIPTION` | 공유 설명 가시성 |
| `PERMISSION_REQUESTED` | 알림 권한 요청 여부 |
| `ALARM_KEY` | 알림 ON/OFF |
| `FIRST_OPEN_KEY` | 첫 실행 여부 |
| `HIDDEN_POPUP_SEQ_SET` | 숨김 처리된 팝업 목록 |
| `TOKEN_EXPIRED` | 토큰 만료 상태 |
| `USER_NAME` | 사용자 이름 |
| `IMAGE_URI` | 프로필 이미지 URI |

Room DB는 비회원 로컬 명언 저장에 사용 (페이지 사이즈 10).
