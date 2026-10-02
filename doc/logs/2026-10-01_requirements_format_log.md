# UR·SR 문서 형식 변경 로그

- 날짜: 2026-10-01
- 목적: 중복 설명을 줄이고 요구사항과 인수 기준을 표에서 함께 읽을 수 있도록 형식을 정리한다.
- 대상: [시스템 요구사항](../architecture_design/system_requirements.md), [사용자 요구사항](../architecture_design/user_requirements.md)

## 시스템 요구사항(SR)

- `Function description` 칼럼을 삭제했다. 기능의 책임은 기존 `Function name`으로 표현한다.
- `Condition`과 `System behavior and result`를 `Requirement` 칼럼으로 합쳤다.
- 각 행의 적용 조건과 필수 동작·결과를 한두 문장으로 작성하고, 필수 동작은 “~해야 한다”로 표현했다.
- `Requirement` 오른쪽에 `Priority` 칼럼을 추가했다. 모든 값은 비워 두었다.
- 정량적인 검증 기준이 있는 표에는 기존 `Verification Criteria` 칼럼을 유지했다.
- 최종 표 구성은 `Sub-SR | Function name | Requirement | Priority`이며, 필요한 표에만 `Verification Criteria`가 뒤따른다.
- 기존 SR·Sub-SR ID, 상태, 출처 UR, 요구사항의 의미, 검증 기준, 미확정 사항은 유지했다.

이 구성은 프로젝트에서 선택한 문서 양식이며, 국제표준이 지정한 칼럼 구성으로 주장하지 않는다.

## 사용자 요구사항(UR)

- 처음에는 각 UR별로 `State | User Story | Acceptance Criteria` 표를 두고, 인수 기준을 `•`와 `<br>`로 표시했다.
- 후속 변경에서 16개 UR을 하나의 표로 통합했다.
- 최종 칼럼 구성은 `ID | name | User story | Acceptance Criteria | State`이며, UR마다 한 행을 사용한다.
- 여러 인수 기준은 `Acceptance Criteria` 셀에서 `•`와 `<br>`로 구분한다.
- UR_13을 요구사항 표에서 제외하고 Excluded Scope에 기록했다.
- 나머지 기존 UR ID, 제목, 상태, 사용자 스토리, 인수 기준은 유지했다.

## 검증

- SR의 5개 요구사항 표와 24개 행, UR의 16개 행을 변경 대상으로 확인했다.
- 변경된 표 구성과 문장을 검토했다.
- 각 문서 변경 후 `git diff --check`를 실행해 통과했다.
- 문서 형식 변경이므로 코드 테스트와 런타임 eval은 실행하지 않았다.
