## 결론

소규모 팀에 가장 적합한 것은 특정 하나의 방법론을 그대로 채택하는 것이 아니라, **공식 표준의 핵심 개념만 유지한 "경량 표준 프로파일"**을 쓰는 방식이다.

권장 조합은 다음과 같다.

| 영역 | 기준 | 실제 적용 |
|---|---|---|
| 요구사항 | ISO/IEC/IEEE 29148:2018 | 간결한 요구사항 + 인수조건 + 추적 ID |
| 품질 요구사항 | ISO/IEC 25010:2023 | 중요한 품질속성 3~5개만 측정 가능하게 명시 |
| 아키텍처 | ISO/IEC/IEEE 42010:2022 | 이해관계자/관심사에 필요한 View만 작성 |
| 문서 구조 | arc42 | 전체 12장을 강제하지 않고 필요한 부분만 |
| 구조 시각화 | C4 Model | Context + Container를 기본으로 사용 |
| 설계 결정 | ADR | 중요한 선택만 짧게 기록 |
| 검증 | 테스트/리뷰 | 요구사항 ↔ 설계 ↔ 테스트를 링크로 추적 |

이 방식이면 학생 프로젝트, 오픈소스, 스타트업, 일반 기업 개발팀까지 상당히 동일한 설계 습관을 유지할 수 있다. 규제가 있는 금융·의료·자동차·항공 등에서는 여기에 산업별 산출물을 추가하는 형태로 확장하면 된다.

ISO 29148은 요구사항 공학의 수집·분석·검증·검증(validation)·관리·추적성을 다루며, ISO 사이트 기준 2018판이 현재 유효하지만 차기판으로 교체가 진행 중이다. ISO 42010:2022는 아키텍처 설명의 구조를 정의하면서도 특정 방법론, 모델링 표기법, 도구, 문서 형식을 강제하지 않는다. 따라서 이런 경량화가 표준의 취지와 충돌하지 않는다. :chatgpt-content-reference{index="0"}

---

## 내가 권하는 실제 설계 절차

소규모 프로젝트에서는 **7단계만 규칙으로 고정**하는 것이 적당하다.

1. **목표와 범위를 1페이지 안에 정의한다.** 문제, 사용자/이해관계자, 핵심 목표, 하지 않을 것, 외부 제약을 적는다. arc42 역시 요구사항 개요를 가능하면 한 페이지 이내로 유지하고 핵심만 작성하라고 권한다. :chatgpt-content-reference{index="1"}
2. **기능 요구사항은 backlog 형태로 관리한다.** 모든 요구사항에 `REQ-001` 같은 ID와 인수조건을 붙인다. 거대한 SRS 문서를 별도로 만들 필요는 없다. ISO 29148에서 중요한 것은 요구사항이 정확하고 모호하지 않으며 검증·추적 가능하게 관리되는 것이다. :chatgpt-content-reference{index="2"}
3. **품질 요구사항 3~5개를 반드시 정량화한다.** 성능, 신뢰성, 보안, 유지보수성 등을 단순히 "빠르게", "확장 가능하게"라고 쓰지 않는다. ISO 25010:2023은 기능 적합성, 성능 효율성, 호환성, 상호작용 능력, 신뢰성, 보안, 유지보수성, 유연성, 안전성의 9개 품질 특성을 제공한다. 이들을 체크리스트로 보고 중요한 것만 고른다. :chatgpt-content-reference{index="3"}
4. **C4 System Context와 Container 두 장을 기본 아키텍처로 만든다.** C4 공식 문서도 대부분의 개발팀에서는 Context와 Container 다이어그램이면 충분하다고 설명한다. Component/Class diagram은 실제로 설명할 필요가 있을 때만 만든다. :chatgpt-content-reference{index="4"}
5. **중요한 실행 흐름만 Runtime/Sequence로 표현한다.** 로그인, 주문, 결제, 비동기 처리, 장애 복구 등 아키텍처를 이해하는 데 필요한 1~5개 흐름만 작성한다. arc42 역시 정적 구조와 runtime 구조를 구분한다. :chatgpt-content-reference{index="5"}
6. **중요한 설계 선택은 ADR로 남긴다.** "왜 PostgreSQL인가", "왜 모놀리스인가", "왜 Redis가 필요한가"처럼 나중에 다시 논쟁할 가능성이 있는 결정만 기록한다. ADR은 Context → Decision → Alternatives → Consequences 정도면 충분하다. 소스 코드와 함께 버전 관리하는 경량 ADR은 실제 업계에서도 사용되어 온 방식이다. :chatgpt-content-reference{index="6"}
7. **구현과 테스트가 설계를 검증하게 한다.** 문서를 완성품으로 취급하지 말고 PR에서 코드와 함께 갱신한다. arc42 역시 설계와 구현을 비교하고 반복적으로 평가할 것을 권한다. Agile 원칙도 과도한 문서보다 동작하는 소프트웨어와 단순성을 우선한다. :chatgpt-content-reference{index="7"}

이 정도가 "규칙은 단순하지만 설계의 중요한 부분은 빠뜨리지 않는" 최소선이라고 본다.

---

# 1. 요구사항은 이렇게 작성하면 된다

거대한 요구사항 명세서 대신 **요구사항 테이블 또는 GitHub Issue/Jira backlog**를 진실의 원천으로 삼는다.

| 필드 | 예 |
|---|---|
| ID | REQ-F-012 |
| 종류 | Functional / Quality / Constraint |
| 요구사항 | 사용자는 이메일로 로그인할 수 있어야 한다 |
| 이유 | 기존 사용자 계정 체계와 통합 |
| 우선순위 | Must |
| 인수조건 | 올바른 계정으로 로그인 시 대시보드가 표시된다 |
| 관련 설계 | ADR-003, Container: Auth API |

여기서 중요한 것은 문장 형식보다 **식별 가능성, 명확성, 검증 가능성, 추적 가능성**이다. ISO 29148에서는 requirements engineering을 요구사항의 발견, 수집, 개발, 분석, 검증, validation, 의사소통, 문서화 및 관리까지 포함하는 활동으로 보고, traceability 역시 명시적으로 정의한다. :chatgpt-content-reference{index="8"}

특히 기능 요구사항 전부를 아키텍처 문서에 복사하지 않는다. 아키텍처에는 **Architecturally Significant Requirements**, 즉 구조를 바꾸는 요구사항만 끌어온다. SEI도 아키텍처에 큰 영향을 주는 요구사항을 별도로 식별해야 하며 품질 요구사항이 특히 중요한 경우가 많다고 설명한다. :chatgpt-content-reference{index="9"}

---

# 2. "비기능 요구사항"은 품질 시나리오로 바꾼다

초보자가 가장 자주 실패하는 부분이 여기다.

나쁜 요구사항:

> 시스템은 빠르고 확장 가능해야 한다.

대신 다음 정도로 작성한다.

> `QA-PERF-01` 정상 운영 상태에서 API 요청의 95%는 300ms 이내에 응답해야 한다.

또는:

> `QA-AVAIL-01` 애플리케이션 인스턴스 하나가 실패해도 30초 이내에 서비스가 자동 복구되어야 한다.

> `QA-MOD-01` 새로운 OAuth 공급자 추가 시 인증 도메인 이외의 비즈니스 모듈 변경 없이 구현할 수 있어야 한다.

SEI 역시 기능 요구사항에 use case가 유용한 것처럼 품질 요구사항에는 **Quality Attribute Scenario**가 유용하며, 품질 요구사항이 아키텍처를 크게 좌우한다고 설명한다. :chatgpt-content-reference{index="10"}

ISO 25010의 9개 항목을 전부 문서화할 필요는 없다. 프로젝트 시작 시 9개를 한번 확인하고, **실제로 구조에 영향을 주는 3~5개만 QA 요구사항으로 승격**시키면 된다. 이것이 표준을 체크리스트로 활용하는 방식이다. :chatgpt-content-reference{index="11"}

---

# 3. 아키텍처 문서는 C4 두 장부터 시작한다

### C4 Level 1 — System Context

"우리 시스템이 무엇이며 누구와 통신하는가"만 표현한다.

```text
Customer
   |
   v
Our Service
   |       \
   v        v
Payment   Email Service
Gateway
```

### C4 Level 2 — Container

애플리케이션 내부의 큰 실행 단위를 표현한다.

```text
Web App
   |
   v
Backend API ----> PostgreSQL
   |
   +-----------> Redis
   |
   +-----------> Worker
```

여기서 "Container"는 Docker container라는 뜻이 아니다. 배포 또는 실행 가능한 애플리케이션/데이터 저장소 수준의 논리적 단위다.

**Component diagram은 기본 산출물이 아니다.** 복잡한 모듈이 있고 설명하지 않으면 이해하기 어려울 때만 작성한다. C4 공식 가이드도 대부분의 팀에서는 Context와 Container 수준이면 충분하다고 명시한다. :chatgpt-content-reference{index="12"}

이 한 가지 규칙만 지켜도 "누구는 클래스 다이어그램부터 그리고, 누구는 인프라부터 그리고, 누구는 ERD를 아키텍처라고 부르는" 문제를 상당히 줄일 수 있다.

---

# 4. ISO 42010의 View 개념도 이것으로 충족시킨다

ISO 42010의 핵심 생각은 사실 복잡하지 않다.

```text
Stakeholder
     ↓
 Concern
     ↓
 Viewpoint
     ↓
   View
```

예를 들어 개발자의 관심사는 모듈 구조이고, 운영자의 관심사는 배포와 장애 처리이고, 보안 담당자의 관심사는 trust boundary와 인증/권한이다.

따라서 모든 프로젝트가 똑같은 다이어그램 15장을 만들 필요가 없다. **실제 stakeholder concern이 있는 View만 만든다.**

ISO 42010 역시 특정 UML이나 특정 문서 템플릿을 강제하지 않고 아키텍처 설명에 필요한 개념과 관계를 규정하는 표준이다. :chatgpt-content-reference{index="13"}

그래서 다음과 같이 해석하면 된다.

| 관심사 | 권장 View |
|---|---|
| 시스템 경계 | C4 Context |
| 전체 구조 | C4 Container |
| 중요한 내부 모듈 | C4 Component |
| 실행 흐름 | Sequence / C4 Dynamic |
| 인프라 | Deployment |
| 데이터 | ERD |
| API | OpenAPI/AsyncAPI 등 계약 |
| 중요한 선택 이유 | ADR |

**필요한 행만 사용한다.**

---

# 5. arc42는 "문서 템플릿"이 아니라 체크리스트로 쓴다

arc42 전체에는 목표, 제약, Context, Solution Strategy, Building Blocks, Runtime, Deployment, Cross-cutting Concepts, Decisions, Quality Requirements, Risks, Glossary의 12개 영역이 있다. :chatgpt-content-reference{index="14"}

이를 전부 별도 문서로 만들면 다시 무거워진다.

소규모 프로젝트에서는 다음처럼 합치면 충분하다.

| 경량 문서 | arc42에 대응 |
|---|---|
| `overview.md` | Goals + Constraints + Context |
| `requirements.md` 또는 backlog | Requirements + Quality Requirements |
| `architecture.md` | Solution Strategy + Building Blocks |
| `runtime.md` | Runtime |
| `deployment.md` | Deployment |
| `decisions/*.md` | Architecture Decisions |
| Issues/backlog | Risks + Technical Debt |

Cross-cutting concept와 Glossary는 실제 필요할 때 해당 문서에 추가한다.

arc42 자체도 agile/lean/formal 프로젝트 모두를 지원하며, 문서량은 시스템의 위험과 이해관계자에 따라 달라져야 하고 "가능한 한 적게 기록하라"는 방향을 명시하고 있다. 또한 Markdown/AsciiDoc과 Git을 이용한 docs-as-code를 권장한다. :chatgpt-content-reference{index="15"}

---

# 6. ADR이 설계 문서의 핵심이다

예를 들어:

```text
ADR-004: PostgreSQL을 주 데이터베이스로 사용

Status
Accepted

Context
트랜잭션 일관성이 중요하며 데이터 간 관계가 많다.

Decision
PostgreSQL을 사용한다.

Alternatives
- MongoDB
- MySQL

Consequences
+ ACID transaction과 관계형 모델 활용 가능
+ 팀 경험이 충분함
- 수평 분산이 필요한 경우 추가 설계 필요

Related
QA-REL-01
REQ-F-021
```

여기서 핵심은 "무엇을 사용한다"보다 **왜 그렇게 결정했는가**다.

라이브러리 하나 설치할 때마다 ADR을 작성해서는 안 된다. 다음 질문 중 하나가 Yes일 때만 작성하면 된다.

"나중에 되돌리기 비싼가?", "시스템 구조에 영향을 주는가?", "여러 대안 사이에서 trade-off가 있었는가?", "3개월 뒤 새 개발자가 왜 이렇게 했는지 물을 가능성이 높은가?"

그렇다면 ADR 대상이다.

---

# 7. 전체 문서량은 이 정도면 충분하다

3~6명 정도의 일반적인 웹/앱 팀이라면 초기 설계 기준으로 다음 정도면 된다.

```text
README.md

docs/
  overview.md
  requirements.md

  architecture/
    context.md
    containers.md
    runtime.md
    deployment.md        # 필요한 경우

  decisions/
    0001-architecture-style.md
    0002-database.md
    0003-authentication.md

contracts/
  openapi.yaml           # API가 있는 경우
```

**초기 문서량을 페이지로 환산하면 약 5~10페이지 수준의 설명 + 2~4개의 다이어그램** 정도를 목표로 하면 된다. 이후 프로젝트가 진행되면서 ADR이 누적되는 구조다.

중요한 점은 "10페이지"라는 숫자 자체가 아니라 **중복 문서를 만들지 않는 것**이다.

예를 들어 API 상세 명세가 `openapi.yaml`에 있다면 architecture.md에 API parameter를 다시 적지 않는다. DB schema가 migration 코드에 있다면 모든 column을 아키텍처 문서에 복사하지 않는다. Jira에 acceptance criteria가 있다면 SRS Word 문서로 다시 옮기지 않는다.

---

# 8. 추적성도 RTM 문서 대신 링크로 해결한다

전통적인 프로젝트에서는 별도 Requirements Traceability Matrix가 상당한 관리비용을 만든다. ISO 29148에서 중요한 것은 **추적 가능하다는 것**이지 반드시 Excel RTM 한 장을 수동 관리해야 한다는 뜻으로 이해할 필요는 없다. 요구사항 추적은 상위 요구와 하위 구현 간의 관계를 식별·문서화하는 개념이다. :chatgpt-content-reference{index="16"}

따라서 작은 팀에서는 이것으로 충분하다.

```text
GOAL-01
  ↓
QA-PERF-01
  ↓
ADR-007
  ↓
Container: Search API
  ↓
TEST-PERF-03
```

GitHub Issue, Markdown 링크, PR, 테스트 ID 등으로 연결해도 된다.

이 연결이 존재하면 요구사항이 바뀌었을 때 "어느 설계와 테스트를 다시 봐야 하는가"를 알 수 있다.

---

# 적용 규칙을 더 압축하면

팀 규칙을 실제로 README에 넣는다면 다음 **10개 규칙**이면 충분하다.

1. 모든 프로젝트는 목표, 범위, non-goal을 먼저 정의한다.
2. 모든 중요한 요구사항에는 고유 ID와 검증 방법을 둔다.
3. 기능 요구사항 전체를 아키텍처 문서에 복사하지 않는다.
4. ISO 25010을 확인하고 중요한 품질 요구사항 3~5개를 수치화한다.
5. 아키텍처는 C4 Context와 Container부터 그린다.
6. Component, Runtime, Deployment, ERD 등은 설명 가치가 있을 때만 추가한다.
7. 중요한 기술적 trade-off는 ADR로 기록한다.
8. 요구사항 → ADR/Architecture → Test를 링크한다.
9. 문서는 코드와 같은 Git 저장소에서 PR로 관리한다.
10. 코드와 불일치하는 문서는 버그로 취급한다.

이 규칙이면 주니어에게도 상당히 명확하다. "무슨 UML을 몇 장 그려야 하지?"가 아니라 **무엇을 왜 설계하고 무엇을 검증해야 하는가**에 집중하게 된다.

---

## 기존 방법론과 비교하면

| 방법 | 소규모 프로젝트 적합성 | 이 방식에서의 역할 |
|---|---:|---|
| ISO 29148 | 원문 그대로는 무거움 | 요구사항 원칙 |
| ISO 42010 | 개념적으로 매우 적합 | 아키텍처 메타모델 |
| ISO 25010 | 적합 | 품질 체크리스트 |
| IEEE 1016 | 낮음 | 참고만 |
| UML | 부분적 | 필요한 Diagram만 |
| 4+1 View | 부분적 | Runtime 관점 등에 참고 |
| arc42 | 높음 | 전체 문서 체크리스트 |
| C4 | 매우 높음 | 구조 시각화 |
| ADR | 매우 높음 | 의사결정 기록 |
| TOGAF | 낮음 | 기업 EA 규모에서 사용 |

특히 IEEE 1016:2009는 소프트웨어 설계 설명 표준이지만 IEEE에서 현재 `Inactive-Reserved` 상태이므로 새 소규모 팀의 중심 표준으로 잡을 이유가 적다. :chatgpt-content-reference{index="17"}

## 따라서 기준선을 하나 정한다면

**"ISO 29148의 요구사항 원칙 + ISO 25010의 품질속성 + ISO 42010의 stakeholder/view 개념을 준수하고, arc42를 체크리스트로 사용하며, C4 + ADR + 실행 가능한 계약/테스트로 문서화한다."**

이 조합이 가장 균형이 좋다.

중요한 것은 이를 **"ISO 29148/42010 완전 준수 프로세스"라고 부르면 안 된다는 것**이다. 완전한 표준 적합성에는 각 표준의 세부 요구조건을 검토해야 한다. 정확한 표현은 **"ISO/IEC/IEEE 표준에 기반한 경량 설계 프로파일"** 정도가 적절하다.

이 방식이면 문서 작성 자체가 목적이 되지 않으면서도, 요구사항·품질속성·아키텍처 View·설계 근거·추적성이라는 정식 소프트웨어 엔지니어링의 핵심은 그대로 남는다. 이는 arc42가 강조하는 "필요한 것만 기록하고 반복적으로 갱신하는" 접근이나 Agile의 단순성 원칙과도 일관된다. :chatgpt-content-reference{index="18"}