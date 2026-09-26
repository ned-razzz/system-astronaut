<p align="center">
  <img src="#" width="96" height="96" alt="" />
</p>

<h1 align="center">System Astronaut</h1>

<p align="center">스킬 설명</p>

<p align="center">
  <a href="https://github.com/ned-razzz/astronauts/stargazers"><img src="https://img.shields.io/github/stars/ned-razzz/astronauts?style=flat&color=yellow" alt="GitHub stars" /></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/ned-razzz/astronauts?style=flat" alt="MIT license" /></a>
</p>

---

## 개요

프로젝트가 무엇인지 설명하고 가치를 나열한 형식 없는 초기 문서인 **Project Description** 또는 사용자 요구를 입력받아 **User Requirements → System Requirements → System Architecture**를 독립 Skill로 작성·검토하는 Codex Skills를 구현한다.

## Skills

```text
.agents/skills/
├── astronaut-ur/
├── astronaut-sr/
└── astronaut-sa/
```

각 Skill은 하나의 입력·사고 과정·출력 형식을 책임진다. 전체 파이프라인을 자동으로 조정하는 Skill은 반복적인 end-to-end 사용 사례가 확인된 뒤 추가한다.

각 산출물은 독립적으로 사용할 수 있으면서도 상위 단계의 요구와 하위 단계의 설계가 연결되도록 구성한다. 소규모 팀의 애자일 개발을 대상으로 하며, 불필요한 문서화를 줄이고 실제 개발에 필요한 핵심 정보에 집중한다.

```text
   Project / User Needs
           ↓
   User Requirements
           ↓
   System Requirements
           ↓
  System Architecture
  (Hardware + Software)
```

## 목적

초기 아이디어와 사용자 요구를 **구현 가능한 시스템 정의와 아키텍처까지 단계적으로 구체화**하는 것이 목적이다.

UR과 SR에서는 **무엇이 필요한지**를 명확히 정의하고, System Architecture에서는 이를 만족하기 위해 **시스템을 어떤 하드웨어와 소프트웨어 구성 요소 및 책임으로 나눌지** 정의한다.

전체 과정에서 요구사항의 명확성·일관성·검증 가능성을 확보하고, **UR → SR → System Architecture 간 추적성**을 유지하여 요구 변경이 설계에 미치는 영향을 파악할 수 있도록 한다.
