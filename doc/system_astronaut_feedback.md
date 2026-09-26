## 총평

현재 3개 Skill의 큰 흐름은 좋다.

```text
Project Brief
    ↓
User Requirements
    ↓
System Requirements
    ↓
Software Architecture
```

특히 **UR과 SR은 이미 소규모 애자일 프로젝트용 경량 요구사항 방법론으로 상당히 잘 설계되어 있다.** 반면 **Software Architecture Skill은 아직 "방법론"이라기보다 작업 목표 몇 줄에 가깝다.** :chatgpt-content-reference{index="0"} :chatgpt-content-reference{index="1"} :chatgpt-content-reference{index="2"}

내가 앞서 제안한 경량 표준과 비교하면 다음과 같다.

| 영역 | 현재 상태 | 평가 |
|---|---|---|
| UR | User Story + Acceptance Criteria | 매우 적합 |
| UR 불확실성 관리 | state + Open Questions | 매우 적합 |
| UR → SR 추적 | 명시적 Source UR | 매우 적합 |
| SR 기능 구조화 | Feature → Sub-SR → Behavior | 매우 적합 |
| SR 구현 독립성 | 강하게 규정 | 매우 적합 |
| SR 품질 요구사항 | 입력에 있을 때만 생성 | 보완 필요 |
| SR 외부 제약조건 | 사실상 제외 | 보완 필요 |
| 승인/상태 관리 | 매우 엄격 | 약간 무거움 |
| SW 구조화 방법 | 거의 없음 | 대폭 보완 필요 |
| Architecture Views | 없음 | 대폭 보완 필요 |
| ADR | 없음 | 대폭 보완 필요 |
| Quality-driven Architecture | 없음 | 대폭 보완 필요 |
| Architecture 검증 | 없음 | 대폭 보완 필요 |

결론적으로 **UR 85~90%, SR 85~90%, SW Architecture 30~40% 정도의 방법론 완성도**로 보는 것이 적절하다. 숫자는 표준 적합성 점수가 아니라 현재 구상한 경량 설계 체계 대비 상대적인 완성도를 뜻한다.

---

# 1. `astronaut-ur`: 방향이 매우 좋다

현재 UR Skill은 다음 원칙을 가지고 있다.

> "A UR body consists of one User Story and its Acceptance Criteria."

그리고 actor, goal, user value, observable outcome을 추출하고 하나의 UR에 하나의 user goal을 두며, Acceptance Criteria를 observable/pass-fail 형태로 작성한다. :chatgpt-content-reference{index="3"}

이것은 내가 제안한 경량 방식과 거의 동일하다.

ISO/IEC/IEEE 29148은 특정 User Story 형식을 강제하지 않고 요구사항 engineering과 well-formed requirements, validation, verification, traceability를 중시한다. 따라서 User Story + Acceptance Criteria를 경량 표현법으로 쓰는 것은 충분히 합리적이다. :chatgpt-content-reference{index="4"}

특히 다음 설계가 좋다.

```text
Project idea
    ↓
Actor / Goal / Value
    ↓
User Story
    ↓
Acceptance Criteria
```

그리고

```text
confirmed
proposed
open
conflicted
out-of-scope
n/a
```

상태를 두어 LLM이 불확실한 요구를 멋대로 채우지 못하게 한 것도 좋은 설계다.

### 다만 한 가지 수정할 부분이 있다

현재 Workflow 2의:

> "Keep only goals needed for the smallest usable scope supported by the input."

은 Agent에게 **scope 결정 권한을 약간 많이 준다.** :chatgpt-content-reference{index="5"}

예를 들어 사용자가 10가지 목표를 명확하게 제시했는데 Agent가 임의로 "MVP에는 6개만 필요하다"고 판단할 가능성이 있다.

따라서 다음 원칙이 더 안전하다.

```text
Preserve all explicitly stated in-scope user goals.

Reduce to the smallest usable scope only when the user explicitly
requests an MVP, prototype, initial release, or scope reduction.
```

즉 **Agent는 요구사항을 정제할 수 있지만 scope를 임의로 결정해서는 안 된다.**

이것 외에는 UR 방법론을 크게 바꿀 필요가 없다.

---

# 2. `astronaut-sr`: 세 Skill 중 가장 잘 설계되어 있다

SR Skill의 가장 좋은 부분은 **System Requirements가 무엇인지 경계를 매우 정확하게 정의한 것**이다.

현재 Skill은:

> "Explain what the system does and which quality conditions it must meet, never how it will be implemented."

라고 정의한다. :chatgpt-content-reference{index="6"}

그리고 실제 구조도:

```text
SR
 ├─ Feature purpose
 ├─ Sub-feature
 │    └─ Behavior
 ├─ Verification Criteria
 └─ Logical Data
```

형태이다.

이 구조는 기존에 사용하던 단순한

```text
SR ID | Feature | Description | Priority
```

보다 훨씬 좋다.

Feature 계층은 유지하면서도 Behavior를 명시해 **"기능 이름만 나열한 문서"가 되는 문제를 해결**한다.

또한 `Data`도 DB schema가 아니라 logical data만 허용한다.

> "Describe their meaning and composition, not database tables, keys, concrete types, message formats, classes, or storage."

이 경계 역시 매우 적절하다. :chatgpt-content-reference{index="7"}

---

## 가장 잘된 부분: 추적성

현재:

```text
UR_01
   ↓
SR_03
   ├─ SR_03.1
   └─ SR_03.2
```

처럼 `Source UR`을 명시한다. :chatgpt-content-reference{index="8"}

ISO 29148에서도 requirements traceability는 상위 요구사항으로의 derivation path와 하위 요구사항으로의 allocation/flow-down path를 식별하는 것으로 정의한다. :chatgpt-content-reference{index="9"}

따라서 별도의 거대한 RTM 문서를 만들지 않고 ID 연결로 추적성을 확보하는 현재 방식은 **경량 프로세스에 매우 적합하다.**

---

# 3. SR에서 가장 중요한 결함: Quality Requirement가 빠질 수 있다

현재 SR은:

> "Analyze each confirmed User Story and its Acceptance Criteria for ... necessary quality constraints."

라고 되어 있다. :chatgpt-content-reference{index="10"}

문제는 **UR에 없는 품질 요구사항을 찾아내는 단계가 없다는 것**이다.

예를 들어 UR이:

```text
관리자는 로봇의 상태를 확인하고 싶다.
```

뿐이라면 여기에서 자동으로 다음 요구사항이 나오지는 않는다.

```text
상태 갱신 latency
통신 장애 복구
로그 보존
동시 접속
인증
가용성
보안
```

그런데 실제 아키텍처를 결정하는 것은 이런 요구사항일 가능성이 높다.

arc42 역시 아키텍처에서 가장 중요한 3~5개의 quality goal을 명시적으로 선정하도록 권장하고 있으며, 품질 요구사항은 아키텍처 결정에 큰 영향을 준다고 설명한다. :chatgpt-content-reference{index="11"}

ISO 25010:2023도 제품 품질을 검토하기 위한 9개 quality characteristic을 제공한다. :chatgpt-content-reference{index="12"}

### 따라서 SR Workflow에 "Quality Sweep" 하나를 넣는 것이 좋다

중요한 것은 **Agent가 NFR을 만들어내라는 것이 아니다.**

다음처럼 해야 한다.

```text
Confirmed UR
     ↓
Functional SR derivation
     ↓
Quality attribute review
     ↓
known requirement → NFR SR
unknown but architecturally relevant → Open Question
irrelevant → ignore
```

예를 들어:

```markdown
## Open Questions

- 최대 허용 주문 처리 응답시간이 정의되지 않았다.
  (**Quality:** Performance efficiency;
   **Source UR:** UR_03;
   **Related SR:** SR_04)

- 서비스 장애 발생 시 요구되는 복구 시간이 정의되지 않았다.
  (**Quality:** Reliability)
```

이렇게 하면 ISO 25010을 **문서 템플릿이 아니라 누락 방지 체크리스트**로 활용할 수 있다.

이것이 현재 SR에서 가장 중요한 개선점이다.

---

# 4. `Priority: Required` 기본값은 바꾸는 것이 좋다

현재 SR Skill은:

> "Use an explicitly supplied priority; otherwise use `Required`."

라고 한다. :chatgpt-content-reference{index="13"}

이것은 현재 Skill의 다른 철학과 충돌한다.

Skill 전체에서는:

> "Do not invent..."

을 강하게 요구하면서 priority만 임의로 `Required`로 결정한다.

예를 들어 사용자가 우선순위를 전혀 정하지 않았다면 Agent는 그것이 Required인지 Optional인지 알 수 없다.

따라서 다음 중 하나가 더 적절하다.

```text
Priority: Unspecified
```

또는 아예 Priority를 생략한다.

내 권장은:

```text
- Priority는 입력에서 명시된 경우에만 출력한다.
```

이다.

UR에서 priority를 의도적으로 빼놓은 현재 설계와도 더 일관된다.

---

# 5. Constraint가 완전히 사라질 위험이 있다

현재 SR은 다음을 금지한다.

> APIs, protocols, technology choices, internal structures, architecture. :chatgpt-content-reference{index="14"}

원칙 자체는 맞다.

그런데 다음 둘은 구분해야 한다.

### 설계자가 선택한 기술

```text
PostgreSQL을 사용한다.
REST를 사용한다.
React를 사용한다.
```

→ Architecture Decision이다.

### 외부에서 강제된 제약

```text
기존 ROS 2 시스템과 연동해야 한다.
고객사가 제공한 OAuth 서버를 사용해야 한다.
Android 15 환경에서 동작해야 한다.
개인정보는 국내에서 저장해야 한다.
```

→ 설계 결정이 아니라 **Constraint**이다.

현재 모델에서는 이것을 넣을 장소가 없다.

따라서 SR Type을 늘리지 않더라도 최소한:

```markdown
## System Constraints
```

같은 별도 영역을 두는 것이 좋다.

arc42에서도 architecture의 핵심 입력으로 technical/organizational constraints를 별도로 취급한다. :chatgpt-content-reference{index="15"}

---

# 6. `confirmed` gate는 좋지만 현재는 다소 엄격하다

현재 파이프라인은 실제로 다음과 같다.

```text
Project Brief
     ↓
UR proposed
     ↓
[사용자 확인]
     ↓
UR confirmed
     ↓
SR proposed
     ↓
[사용자 확인]
     ↓
SR confirmed
     ↓
Software Architecture
```

SR Skill은 confirmed UR만 사용하고, SW Skill은 confirmed SR만 사용한다. :chatgpt-content-reference{index="16"} :chatgpt-content-reference{index="17"}

방법론적으로는 매우 좋다.

LLM이:

```text
추측한 UR
→ 추측한 SR
→ 추측한 Architecture
```

를 연쇄적으로 만들어내는 것을 막기 때문이다.

다만 요구사항 40개를 하나씩 `confirmed`로 바꾸는 프로세스가 되면 소규모 팀에서는 번거롭다.

따라서 **gate 자체는 유지하되 artifact-level confirmation을 지원**하는 편이 좋다.

예:

```text
"현재 UR 전체를 승인한다."
→ 모든 proposed UR → confirmed
```

또는:

```text
"UR_01~UR_08 승인, UR_09는 open"
```

이렇게 하면 rigor와 agility를 동시에 유지할 수 있다.

---

# 7. 추적 구조는 최종적으로 이렇게 만드는 것이 좋다

현재 Skill의 가장 강한 특징인 traceability를 Architecture까지 그대로 확장하면 된다.

```text
Project Brief
      ↓
UR_03
      ↓
SR_04
      ↓
QA_02
      ↓
Architecture Driver
      ↓
ADR_03
      ↓
Order Service
      ↓
Test
```

별도의 거대한 traceability table은 필요 없다.

Architecture element마다:

```markdown
Source SR: SR_03, SR_04
```

ADR에도:

```markdown
Related SR: SR_04, SR_12
```

정도로 연결하면 충분하다.

ISO 42010도 특정 표기법이나 설계 프로세스를 강제하는 표준이 아니라 architecture description의 concepts와 관계를 정의하는 표준이다. 따라서 이처럼 C4/ADR 기반의 경량 표현을 사용하는 것은 자연스럽다. :chatgpt-content-reference{index="22"}

---

# 내가 권하는 최종 방법론

현재 Astronauts를 다음처럼 정의하면 매우 일관된 방법론이 된다.

```text
PROJECT BRIEF
    │
    ▼
┌──────────────────────────────┐
│ User Requirements            │
│                              │
│ User Story                   │
│ Acceptance Criteria          │
└──────────────┬───────────────┘
               │ confirmed
               ▼
┌──────────────────────────────┐
│ System Requirements          │
│                              │
│ Feature                      │
│ ├─ Sub-feature               │
│ ├─ Behavior                  │
│ ├─ Verification             │
│ └─ Logical Data             │
│                              │
│ + Quality Attribute Sweep    │
│ + System Constraints         │
└──────────────┬───────────────┘
               │ confirmed
               ▼
┌──────────────────────────────┐
│ System Architecture          │
│                              │
└──────────────────────────────┘
```

이 구조의 장점은 **UR/SR/Architecture의 역할이 서로 겹치지 않는다는 것**이다.

- UR = "사용자가 무엇을 필요로 하는가"
- SR = "시스템이 무엇을 해야 하는가"
- Architecture = "그 요구를 만족시키기 위해 시스템을 어떻게 구조화할 것인가"
- ADR = "왜 그렇게 구조화했는가"

현재 Skill에서 **UR과 SR의 철학은 유지하는 것이 좋다.** 수정 우선순위를 잡는다면 `astronaut-sw`를 먼저 대폭 구체화하고, 그 다음 `astronaut-sr`에 `Quality Attribute Sweep + Constraint 처리`를 추가하며, 마지막으로 UR의 자동 scope 축소 규칙만 조정하는 순서가 가장 적절하다.