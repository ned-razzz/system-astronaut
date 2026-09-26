<p align="center">
  <img src="assets/system-astronaut.svg" width="128" height="128" alt="오른쪽 아래를 향한 로켓 로고" />
</p>

<h1 align="center">System Astronaut</h1>

<p align="center">프로젝트 아이디어를 사용자 요구사항, 시스템 요구사항, 시스템 아키텍처로 구체화하는 세 가지 Agent Skill</p>

## 개요

System Astronaut는 요구사항과 아키텍처를 작성하거나 검토할 때 사용하는 독립적인 Skill 세 개로 구성된다. UR은 프로젝트 설명에서 시작하고, SR과 SA는 각각 앞 단계의 **확정된 산출물**에서 도출한다. 세 단계를 자동으로 실행하는 Skill은 없다.

```text
프로젝트 설명 → 사용자 요구사항(UR) → 시스템 요구사항(SR) → 시스템 아키텍처(SA)
```

| Skill | 입력 | 하는 일 | 산출물 |
|---|---|---|---|
| [`astronaut-ur`](skills/astronaut-ur/SKILL.md) | 프로젝트 설명, 제품 아이디어, 사용자 요구 | 사용자 목표를 User Story와 검증 가능한 Acceptance Criteria로 정리하거나 기존 UR을 검토 | `UR_01`부터 시작하는 사용자 요구사항 |
| [`astronaut-sr`](skills/astronaut-sr/SKILL.md) | `confirmed` UR, 별도로 명시된 외부 제약 | 시스템 기능과 품질 요구사항을 도출하고, 외부에서 부과된 시스템 제약을 별도로 기록하거나 기존 SR을 검토 | `SR_01`부터 시작하는 시스템 요구사항과 UR 추적 정보 |
| [`astronaut-sa`](skills/astronaut-sa/SKILL.md) | `confirmed` SR | 필요한 하드웨어·소프트웨어 구성 요소, 책임, 인터페이스, 데이터 흐름, 배치 경계를 정의 | 출처 SR이 연결된 시스템 아키텍처 |

## 사용 흐름

1. 프로젝트 설명을 제공하고 `astronaut-ur`에 UR 작성을 요청한다. UR에는 사용자 목표와 사용자가 확인할 수 있는 결과를 적고, API·데이터베이스·기술 선택 같은 구현 사항은 넣지 않는다.
2. UR의 내용을 검토하고 확정할 항목을 명시한다. `astronaut-sr`은 `confirmed` UR에서만 기능·품질 요구사항을 도출한다. 확정되지 않은 UR은 사용하지 않은 입력으로 보고한다.
3. SR의 내용을 검토하고 확정할 항목을 명시한다. `astronaut-sa`는 `confirmed` SR을 바탕으로 아키텍처를 정의하고 각 설계 결정의 출처 SR을 표시한다.

예를 들어 다음과 같이 요청할 수 있다.

```text
이 프로젝트 설명을 바탕으로 astronaut-ur로 사용자 요구사항을 작성해.
UR_01과 UR_02를 확정했어. astronaut-sr로 시스템 요구사항을 작성해.
SR_01과 SR_02를 확정했어. astronaut-sa로 시스템 아키텍처를 작성해.
```

각 Skill은 기존 산출물의 검토에도 사용할 수 있다. 앞 단계의 문서를 수정하거나 확정할 때는 **대상 ID를 명시**하면 변경 범위를 분명히 할 수 있다.

## 작성 원칙

- 상태는 `confirmed`, `proposed`, `open`, `conflicted`, `out-of-scope`, `n/a`를 구별한다. 초안이라는 이유만으로 확정하지 않으며, 미결정 사항을 임의로 채우지 않는다.
- UR은 사용자 관점의 목표와 합격 여부를 판단할 수 있는 기준에 집중한다. 사용자가 명시한 범위는 임의로 축소하지 않는다.
- SR은 시스템의 기능과 동작, 필요한 품질 조건을 설명한다. 구현 방법을 선택하지 않으며, 각 기능·품질 SR에 출처 UR을 연결한다. 외부에서 명시한 시스템 제약은 별도 항목으로 기록한다.
- SA는 확정된 SR에 필요한 구조만 설명한다. 관련 설계 결정마다 출처 SR을 연결하고, 결정되지 않은 사항은 `open`으로 남긴다. 하드웨어 또는 소프트웨어 설계가 해당되지 않으면 이유와 함께 `n/a`로 표시한다.

## 저장소 구성

```text
skills/
├── astronaut-ur/SKILL.md
├── astronaut-sr/SKILL.md
└── astronaut-sa/SKILL.md
tests/astronaut-ur/
├── cases.yaml
└── fixtures/
```

`tests/astronaut-ur/cases.yaml`에는 UR Skill의 호출 범위와 생성 결과를 확인하기 위한 사례가 있다. SR·SA용 테스트 사례와 자동 실행기는 현재 없다.

Skill을 사용하는 환경의 Skill 디렉터리에 필요한 `skills/astronaut-*` 폴더를 복사해 설치할 수 있다. 저장소의 `scripts/install-astronaut-*.ps1`은 현재 실제 Skill 위치와 다른 경로 및 이전 Skill 이름을 참조하므로 그대로 실행할 수 없다.

## 라이선스

[MIT](LICENSE)
