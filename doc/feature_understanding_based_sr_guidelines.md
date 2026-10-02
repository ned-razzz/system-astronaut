# System Requirements

## 작성 원칙

System Requirements는 시스템이 제공하는 기능과 동작을 제3자가 추가 설명 없이 이해할 수 있도록 작성한다.

* `SR`은 시스템의 주요 **Feature**를 나타낸다.
* `Sub-SR`은 Feature를 구성하는 **의미적으로 완결된 Sub-feature 또는 Behavior**를 나타낸다.
* 각 Sub-SR의 `Behavior`는 시스템이 어떤 조건에서 무엇을 해야 하는지 명확하게 정의한다.
* 필요한 경우 `Verification Criteria`를 통해 정량적 기준이나 검증 조건을 정의한다.
* 문서에 명시되지 않은 동작을 개발자가 추측해야 하는 표현을 사용하지 않는다.
* UR에서 결정할 수 없는 사항은 임의로 정의하지 않고 `Open Questions`에 기록한다.

---

## SR_01 <Feature Name>

<이 Feature가 무엇이며 시스템 전체에서 어떤 역할을 하는지 1~3문장으로 설명한다.
제3자가 이 설명만 읽어도 해당 기능의 목적과 전체 동작을 이해할 수 있어야 한다.>

* **Type:** Functional | Non-functional
* **State:** proposed | approved | implemented
* **Source UR:** UR_01, UR_02
* **Priority:** Required | Optional

### SR_01.1 <Sub-feature Name>

<이 Sub-feature가 담당하는 동작과 범위를 간단히 설명한다.>

#### Behavior

* <조건>에서 시스템은 <행동 또는 결과>를 수행해야 한다.
* <동작이 이어지는 경우 순서와 조건을 명확하게 작성한다.>
* <사용자 입력, 시스템 상태, 대상 상태 등에 따라 동작이 달라지면 각각 명시한다.>
* <실패, 중단, 대상 부재 등 기능 이해에 필요한 예외 동작을 명시한다.>

#### Verification Criteria

> 정량적 기준 또는 별도의 검증 조건이 필요한 경우에만 작성한다.

* <시간, 횟수, 성공률, 범위 등 검증 가능한 기준>
* <시험 시 만족해야 하는 명확한 결과>

---

### SR_01.2 <Sub-feature Name>

<Sub-feature 설명>

#### Behavior

* 시스템은 <조건>에서 <행동/결과>를 수행해야 한다.
* 시스템은 <추가 동작>을 수행해야 한다.

#### Verification Criteria

* <필요한 경우 작성>

---

### Data

> Feature의 동작을 이해하는 데 필요한 데이터, 상태, 값이 있을 때만 작성한다.

* `<field>`: <meaning>
* `<field>`: <meaning>
* `<state>`:

  * `<value1>`: <meaning>
  * `<value2>`: <meaning>

---

## SR_02 <Feature Name>

...

---

# Open Questions

UR 또는 현재 요구사항만으로 확정할 수 없는 사항을 기록한다.

* <확정되지 않은 동작 또는 범위> (**Source UR:** UR_XX)
* <정의가 필요한 용어 또는 상태> (**Related SR:** SR_XX.X)
* <정량적 기준이 필요한 사항> (**Related SR:** SR_XX.X)
