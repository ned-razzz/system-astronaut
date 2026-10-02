# UR·SR 미해결 결정 섹션 명칭 변경 로그

- 날짜: 2026-10-02
- 대상: [사용자 요구사항](../architecture_design/user_requirements.md),
  [시스템 요구사항](../architecture_design/system_requirements.md)
- 목적: 사용자에게 결정을 요청하는 질문을 제품 차원과 시스템 명세 차원으로 구분한다.

## 논의와 결정

UR과 SR의 `Open Questions`는 모두 모호한 사항을 질문으로 남기지만, 답변으로 확정하는
대상이 다르다. UR에서는 사용자 목표, 제품 범위, 수용 조건을 정한다. SR에서는 확정된
UR을 충족할 시스템 동작, 품질 기준, 외부 제약을 명확히 한다.

처음에는 각 결정 대상을 드러내는 한국어 명칭과 ‘결정을 위한 질문’이라는 표현을 검토했다.
사용자는 `Pending Product Decisions`와 `Pending Specification Decisions`를 제안했다.
UR도 명세에 해당하므로 SR의 명칭에 `System`을 추가하는 안을 채택했다.

- UR: `Pending Product Decisions`
- SR: `Pending System Specification Decisions`

`Pending`은 사용자 판단을 기다리는 상태를, `Decisions`는 답변으로 결정해야 할 사항임을
나타낸다. 각 항목은 질문형으로 작성해 사용자에게 답변을 요청한다는 의도를 유지한다.
SR의 모든 요구사항에 수치가 필요한 것은 아니며, 우선순위는 명시적으로 주어진 경우에만
기록한다. 구현 방법은 별도 설계에서 다룬다.

## 변경 내용

- UR의 `Open Questions`를 `Pending Product Decisions`로 변경하고 섹션의 목적을 설명했다.
- SR에는 기존 미해결 질문 섹션이 없어 `Pending System Specification Decisions`를 추가했다.
- 두 문서의 설명과 상호 참조 링크를 새 제목과 앵커에 맞춰 갱신했다.
- SR에는 등록된 질문이 없다는 사실과 명세가 모두 확정되었다는 판단을 구분해 적었다.
- 기존 작업 트리의 요구사항 내용과 상태를 보존하고, 이번 작업에서는 새 질문이나 답변을
  도출하지 않았다.

## 검증

- 두 문서의 섹션 제목, 상호 참조 앵커, 기존 `Open Questions` 참조 제거를 확인했다.
- `git diff --check`로 공백 오류를 확인했다.
- 문서 변경이므로 코드 테스트와 런타임 eval은 실행하지 않았다.
