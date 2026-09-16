## 개요: UR 구성 방식과 결론

이 프로젝트에서는 **User Requirements(UR)를 `User Story + Acceptance Criteria`로 구성한다.**

```text
UR
├─ User Story
└─ Acceptance Criteria
```

역할은 명확히 분리한다.

* **User Story**: 사용자가 **누구이며, 무엇을 원하고, 왜 원하는지** 정의한다.
* **Acceptance Criteria**: 그 요구가 **충족되었다고 판단할 수 있는 조건**을 정의한다.

이 방식을 채택한 이유는 개인·소규모 팀의 애자일 개발에서는 상세한 요구사항 문서를 처음부터 완성하는 것보다 **사용자 가치와 검증 기준만 명확히 기록하고, 세부사항은 대화와 Refinement 과정에서 발전시키는 방식**이 적합하기 때문이다.

이는 애자일의 **간결한 문서, 사용자 가치 중심 개발, 지속적인 요구사항 구체화**와 부합한다. Agile Manifesto는 포괄적인 문서보다 작동하는 소프트웨어와 변화에 대한 대응을 더 중시하며, Scrum에서도 Product Backlog Item의 고정된 작성 형식을 요구하지 않는다. ([Agile Manifesto][1])

따라서 이 프로젝트의 요구사항 계층은 다음과 같이 구분한다.

```text
User Requirements
사용자가 무엇을 원하며 어떤 조건이면 만족하는가?
        ↓
System Requirements
그 요구를 만족하기 위해 시스템은 무엇을 해야 하는가?
        ↓
HW / SW Architecture
그 시스템을 어떻게 구성할 것인가?
```

---

## 용어 정리

### User Requirements

**User Requirements는 사용자의 관점에서 제품을 통해 달성하려는 목적과 기대 결과를 정의한 요구사항이다.**

이 프로젝트에서는 별도의 복잡한 UR 명세 구조를 만들지 않고 다음 두 요소만 기록한다.

```text
User Requirement
= User Story + Acceptance Criteria
```

UR에서는 다음과 같은 구현 세부사항을 다루지 않는다.

```text
React를 사용한다.
REST API를 제공한다.
DB에 특정 테이블을 생성한다.
센서 데이터를 10 Hz로 수집한다.
```

이런 내용은 SR 또는 그 이하 설계 단계에서 다룬다.

또한 `User Story + Acceptance Criteria`가 Scrum에서 강제하는 공식 UR 형식이라는 의미는 아니다. Scrum은 Product Backlog Item에 정해진 형식을 요구하지 않으며, User Story 역시 사용할 수 있는 여러 표현 방법 중 하나다. 즉 **소규모 팀에 적합하다고 판단하여 이 프로젝트에서 채택하는 UR 작성 규칙**이다. ([Scrum.org][2])

### User Story

**User Story는 사용자가 원하는 것을 사용자 관점에서 짧게 표현한 것이다.**

기본적으로 다음 세 가지 질문에 답한다.

```text
WHO  : 누가 원하는가?
WHAT : 무엇을 원하는가?
WHY  : 왜 원하는가?
```

대표적인 형식은 다음과 같다.

```text
[사용자]로서,
[기능/목표]를 하고 싶다.
그래야 [가치/목적]을 달성할 수 있다.
```

예:

```text
사용자로서, 새로운 Todo를 등록하고 싶다.
그래야 해야 할 일을 기록할 수 있다.
```

Agile Alliance가 소개하는 일반적인 User Story template도 `As a [who] / I want [what] / So that [why]` 구조이며, 형식 자체를 엄격하게 지키는 것보다 사용자와 목적을 명확히 하는 것이 중요하다고 설명한다. ([Agile Alliance][3])

### Acceptance Criteria

**Acceptance Criteria는 User Story가 충족됐다고 판단하기 위한 관찰·검증 가능한 합격 조건이다.**

예:

```text
User Story
사용자로서 새로운 Todo를 등록하고 싶다.
그래야 해야 할 일을 기록할 수 있다.

Acceptance Criteria
- Todo 제목을 입력할 수 있다.
- Todo를 저장할 수 있다.
- 저장된 Todo가 목록에 표시된다.
- 제목이 비어 있으면 저장할 수 없다.
```

따라서 둘의 차이는 다음과 같다.

```text
User Story
→ 무엇을 왜 원하는가?

Acceptance Criteria
→ 어떤 상태가 되면 그 요구를 만족했다고 인정하는가?
```

Acceptance Criteria는 가능하면 **Pass/Fail을 판단할 수 있도록 작성**한다. 복잡한 행동 조건은 필요할 때 `Given-When-Then` 형태로 표현할 수도 있다. Agile Alliance도 Acceptance Criteria를 자동화된 Acceptance Test로 직접 활용할 수 있을 정도로 명확하게 표현하는 것을 성숙한 User Story 작성 능력으로 설명한다. ([Agile Alliance][4])

---

## UR 작성 방법

각 UR은 다음 형태로 작성한다.

```markdown
## UR_01 Todo 생성

### User Story

사용자로서, 새로운 Todo를 등록하고 싶다.
그래야 해야 할 일을 기록할 수 있다.

### Acceptance Criteria

- Todo 제목을 입력할 수 있다.
- Todo를 저장할 수 있다.
- 저장된 Todo가 목록에 표시된다.
- 제목이 비어 있으면 저장할 수 없다.
```

작성 원칙은 다음과 같다.

1. **하나의 UR은 하나의 사용자 목적을 다룬다.**
2. User Story에는 **사용자, 원하는 것, 목적/가치**를 표현한다.
3. 짧고 단순하게 작성한다.
4. Acceptance Criteria는 **객관적으로 확인 가능한 조건**으로 작성한다.
5. Acceptance Criteria에는 필요한 동작과 결과를 쓰되 **구현 기술은 쓰지 않는다.**
6. 모든 세부사항을 처음부터 문서화하지 않는다.
7. 부족한 세부사항은 팀의 **Conversation / Refinement 과정에서 구체화**한다.
8. 구현 방법, 내부 데이터 구조, 통신 방식, 기술 스택 등은 SR 또는 설계 단계로 넘긴다.
9. 팀 전체에 공통으로 적용되는 코드 리뷰, 테스트 통과 등의 **Definition of Done은 개별 UR의 Acceptance Criteria와 분리**한다.

결과적으로 UR은 **짧지만 모호하지 않아야 한다.**

---

## 해당 방법을 선택한 이유와 근거

### 1. 소규모 애자일 팀에 필요한 최소 정보만 남길 수 있다

개인 또는 소규모 팀에서는 대규모 조직처럼 방대한 요구사항 문서를 유지하는 비용이 크다.

`User Story + Acceptance Criteria`는 최소한으로 다음 두 가지를 보존한다.

```text
왜 만드는가? → User Story
언제 완성인가? → Acceptance Criteria
```

그 외의 세부사항은 실제 개발이 가까워졌을 때 Refinement를 통해 추가한다.

이는 애자일 선언의 **포괄적인 문서보다 작동하는 소프트웨어**, **계획 고정보다 변화 대응**이라는 방향과 일치한다. ([Agile Manifesto][1])

### 2. 요구사항이 사용자 가치에서 벗어나는 것을 방지한다

기능 목록만 작성하면 요구사항이 쉽게 다음처럼 변한다.

```text
Todo Create API 구현
Todo DB Table 생성
POST /todos 구현
```

이렇게 되면 **왜 필요한 기능인지**가 사라지고 설계와 요구사항이 섞인다.

User Story는 의도적으로 `WHO + WHAT + WHY`를 표현하게 하므로 개발자가 기능 자체보다 **사용자가 달성하려는 결과**를 먼저 보게 한다. Agile Alliance 역시 이 형식의 목적을 단순한 템플릿 준수보다 사용자와 목표를 계속 인식하게 하는 데 두고 있다. ([Agile Alliance][3])

### 3. Acceptance Criteria가 모호한 User Story를 보완한다

User Story만 작성하면 다음과 같은 문제가 생긴다.

```text
사용자는 Todo를 등록할 수 있어야 한다.
```

여기서 "등록할 수 있다"의 범위가 불분명하다.

Acceptance Criteria를 추가하면:

```text
- 제목을 입력할 수 있다.
- 저장할 수 있다.
- 저장 결과를 확인할 수 있다.
- 빈 제목은 저장할 수 없다.
```

개발자와 사용자가 **같은 완료 조건을 공유**할 수 있다.

Acceptance Criteria는 요구사항을 검증 가능한 형태로 바꾸며, Acceptance Test로 연결할 수도 있다. ([Agile Alliance][4])

### 4. User Story의 3C 방식과 부합한다

User Story의 대표적인 사고방식은 **Card – Conversation – Confirmation**이다.

```text
Card
→ User Story를 짧게 기록

Conversation
→ 사용자·개발자가 세부 요구사항을 논의

Confirmation
→ Acceptance Criteria 등으로 요구 충족 여부 확인
```

Agile Alliance도 User Story를 이 세 요소로 설명한다. ([Agile Alliance][5])

이 프로젝트에서는 이를 다음과 같이 적용한다.

```text
문서에 저장
├─ User Story        ← Card
└─ Acceptance Criteria ← Confirmation

개발 과정에서 수행
└─ Conversation / Refinement
```

즉 **Conversation을 별도 문서 필드로 만들지 않고 개발 프로세스로 취급한다.**

### 5. 요구사항을 처음부터 완성하려 하지 않는 애자일 Refinement와 맞는다

Scrum에서 Product Backlog Item은 처음에는 높은 수준의 아이디어일 수 있으며, 개발 시점이 가까워지면서 Refinement를 통해 작고 명확한 항목으로 발전한다. 또한 필요한 상세 속성은 업무 영역에 따라 달라질 수 있다. ([Scrum.org][6])

따라서 UR 작성 단계에서 모든 예외 조건과 시스템 동작을 작성하는 대신:

```text
초기
User Story + 핵심 Acceptance Criteria

        ↓ Refinement

구체화된 Acceptance Criteria

        ↓

System Requirements

        ↓

설계 / 구현 / 테스트
```

방식으로 발전시키는 것이 적합하다.

### 6. UR과 SR의 책임을 명확히 분리할 수 있다

현재 프로젝트에서는 UR 다음 단계로 별도의 **System Requirements**를 작성한다.

따라서 UR에서 시스템 수준의 상세사항까지 작성하면 두 문서가 중복된다.

예를 들어:

```text
UR

User Story
고객으로서 주문한 상품을 결제하고 싶다.

Acceptance Criteria
- 결제 수단을 선택할 수 있다.
- 주문 금액을 확인할 수 있다.
- 결제를 완료할 수 있다.
```

여기서는 사용자의 요구와 합격 조건까지만 정의한다.

이후 SR에서:

```text
- 시스템이 지원해야 하는 결제 방식
- 결제 상태 관리
- Timeout
- 결제 성공/실패 처리
- 제조 프로세스와의 연계
```

등을 정의한다.

따라서 **UR은 사용자 요구를 정의하고, SR은 그 요구를 만족시키기 위한 시스템 요구사항으로 구체화한다.** 이 분리는 요구사항 중복을 줄이고 UR → SR → Architecture의 추적 관계도 명확하게 만든다.

### 최종 채택 원칙

```text
User Requirements = User Story + Acceptance Criteria
```

단, 이것을 모든 애자일 프로젝트가 따라야 하는 표준 형식으로 보지는 않는다. Scrum 자체는 Backlog Item의 형식을 규정하지 않는다. ([Scrum.org][2])

이 방식을 채택하는 근거는 **소규모 팀에 필요한 수준으로 문서를 최소화하면서도 사용자 가치, 요구 범위, 검증 기준을 잃지 않고, Conversation과 Refinement를 통해 변화에 대응할 수 있기 때문**이다. 따라서 현재 목표인 **개인·강소기업의 소규모 애자일 개발을 위한 UR 작성 방식으로 적합하다.**

[1]: https://agilemanifesto.org/?external_link=true&utm_source=chatgpt.com "Manifesto for Agile Software Development"
[2]: https://www.scrum.org/resources/product-backlog-items?utm_source=chatgpt.com "Product Backlog Items | Scrum.org"
[3]: https://agilealliance.org/glossary/user-story-template/?utm_source=chatgpt.com "User Story Template for Agile | Agile Alliance"
[4]: https://agilealliance.org/glossary/user-stories/?utm_source=chatgpt.com "What are User Stories? | Agile Alliance"
[5]: https://agilealliance.org/glossary/three-cs/?utm_source=chatgpt.com "What are the Three C's | Agile Alliance"
[6]: https://www.scrum.org/resources/what-is-a-product-backlog?utm_source=chatgpt.com "What is a Product Backlog? | Scrum.org"
