# System Requirements 작성 방법

## 1. 목적

System Requirements(SR)는 User Requirements(UR)를 기반으로 **시스템이 무엇을 해야 하는지**와 **어떤 품질 조건을 만족해야 하는지** 정의한다.

구현 기술이나 시스템 구조 등 **어떻게 구현할지는 정의하지 않는다.** 해당 내용은 이후 설계에서 다룬다.

## 2. 요구사항 종류

SR은 다음 두 종류만 작성한다.

### Functional Requirements

시스템이 제공해야 하는 기능과 동작을 정의한다.

예:

* 고객의 주문을 접수할 수 있어야 한다.
* 로봇이 지정된 테이블로 이동할 수 있어야 한다.
* 관리자가 로그를 조회할 수 있어야 한다.

### Non-Functional Requirements

시스템이 만족해야 하는 품질과 성능 기준을 정의한다.

필요한 항목만 작성한다.

* Performance
* Safety
* Reliability
* Security
* Usability
* Maintainability
* 기타 시스템 품질 조건

가능한 한 검증 가능한 조건으로 작성한다.

예:

* 결제 대기 시간은 최대 60초여야 한다.
* 장애물 감지 시 로봇은 정지해야 한다.

## 3. Functional Requirement 구조

기능 요구사항은 다음 계층으로 작성한다.

```text
Feature
├── Description
├── Sub-feature
│   ├── Requirement
│   └── Requirement
├── Data
└── Priority
```

### Feature

시스템이 제공하는 하나의 주요 기능이다.

예:

* 주문 관리
* 상품 관리
* 테이블 서빙
* 실시간 모니터링
* 로그 관리

각 Feature에는 고유한 `SR_ID`를 부여한다.

### Description

Feature가 무엇을 위한 기능인지 한두 문장으로 정의한다.

### Sub-feature

Feature를 구성하는 세부 기능이다.

각 Sub-feature 아래에는 시스템이 수행해야 하는 구체적인 동작을 작성한다.

### Data

해당 기능을 이해하고 구현하는 데 필요한 **논리적 데이터 항목**을 정의한다.

예:

```text
주문 데이터
- 주문 ID
- 주문 상품 목록
  - 상품
  - 옵션
  - 수량
- 수령 방식
- 총 주문 금액
- 결제 상태
```

데이터의 의미와 구성만 정의한다.

다음과 같은 구현 세부사항은 SR에서 정의하지 않는다.

* DB Table / Schema
* PK / FK
* 구체적인 Data Type
* JSON / Protobuf Message
* C++ Class
* 저장 방식

이러한 내용은 SW Architecture 또는 상세 설계에서 정의한다.

## 4. Markdown 작성 형식

Table보다 Markdown Heading을 사용하여 Feature와 Sub-feature의 계층 관계를 표현한다.

```markdown
## SR_03 주문 관리

고객의 주문을 접수하고 관리할 수 있는 기능이다.

### 주문 접수

- 고객의 주문을 접수할 수 있어야 한다.
- 하나의 주문에 여러 상품을 포함할 수 있어야 한다.

### 주문 취소

- 고객은 결제 전에 주문을 취소할 수 있어야 한다.

### 주문 데이터

- 주문 ID
- 주문 상품 목록
  - 상품
  - 옵션
  - 수량
- 수령 방식
- 총 주문 금액
- 결제 상태

**Priority:** Required
```

Markdown 계층은 다음 규칙을 사용한다.

```text
##     SR / Feature
###    Sub-feature
-      Requirement 또는 Data
  -    세부 조건 또는 하위 Data
```

## 5. 작성 원칙

### 무엇을 중심으로 작성한다

SR은 다음 질문에 답해야 한다.

> 시스템이 무엇을 해야 하는가?

> 시스템이 어떤 품질 조건을 만족해야 하는가?

### 구현 방법은 작성하지 않는다

SR에서는 특정 구현 기술이나 Architecture를 결정하지 않는다.

예:

```text
O  관제 시스템은 로봇과 통신할 수 있어야 한다.
O  통신 단절을 일정 시간 이내에 감지할 수 있어야 한다.

X  ROS2 DDS를 사용한다.
X  Fast DDS를 사용한다.
X  Backend는 FastAPI로 구현한다.
X  PostgreSQL에 데이터를 저장한다.
```

구현 방법을 결정하지 않고도 요구사항을 이해하고 검증할 수 있어야 한다.

### 명확하고 검증 가능하게 작성한다

모호한 표현보다 실제 테스트로 충족 여부를 판단할 수 있는 표현을 사용한다.

```text
X  결제를 빠르게 처리해야 한다.

O  결제 대기 시간은 최대 60초여야 한다.
```

## 6. UR과 Architecture와의 관계

전체 개발 문서의 역할을 다음과 같이 구분한다.

```text
User Requirements
        │
        │ 사용자가 무엇을 원하는가
        ▼
System Requirements
        │
        │ 시스템이 무엇을 해야 하는가
        │ 어떤 품질을 만족해야 하는가
        ▼
HW / SW Architecture
        │
        │ 어떻게 구현할 것인가
        ▼
Implementation
```

UR의 `User Story + Acceptance Criteria`를 분석하여 필요한 System Feature와 Sub-feature를 도출한다.

따라서 기본 변환 관계는 다음과 같다.

```text
User Story + Acceptance Criteria
            ↓
Feature + Sub-feature + Data
            +
필요한 Non-Functional Requirements
```

:::
