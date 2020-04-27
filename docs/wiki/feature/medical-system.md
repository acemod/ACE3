---
layout: wiki
title: Medical System
description: ACE3 provides users with a more realistic medical system.
group: feature
order: 4
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview
ACE3 provides users with a more realistic medical system.

_tbd_

The old documentation (pre medical rewrite) can be [found on github](https://github.com/acemod/ACE3/blob/v3.12.6/docs/wiki/feature/medical-system.md){:target="_blank"}

## 2. Curated Medical Settings

These settings are curated presets for different playstyles. They are meant to be used with the user config for the [CBA settings system](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System){:target="_blank"}.

Feel free to tweak the values of the settings to adjust it to your likings.

### 2.1 Settings for Co-Op missions

#### 2.1.1 Preset 1

```c++
force ace_medical_fatalDamageSource = 1; // Sum of Trauma death condition
force ace_medical_AIDamageThreshold = 0.2; // Decreased AI damage threshold so AI dies in single headshot and few torso taps depending on vest
force ace_medical_playerDamageThreshold = 3.5; // Increased damage threshold for players, high caliber weapons should still be fatal
force ace_medical_bleedingCoefficient = 0.25;
force ace_medical_spontaneousWakeUpChance = 0.85; // Stabilised players will wake up fast
force ace_medical_spontaneousWakeUpEpinephrineBoost = 3;
force ace_medical_statemachine_AIUnconsciousness = true;
force ace_medical_statemachine_cardiacArrestTime = 630;
```

_more tbd_

### 2.2 Settings for PvP missions

#### 2.2.1 Preset 1

```c++
force ace_medical_fatalDamageSource = 1; // Sum of Trauma death condition
force ace_medical_feedback_painEffectType = 2; // Forced pain effect type to ensure that everyone is handicapped in the same way
force ace_medical_spontaneousWakeUpChance = 0.15; // don't let players wake up too fast
force ace_medical_statemachine_cardiacArrestTime = 300; // players should die fast once they are down and not treated
force ace_medical_treatment_allowSelfStitch = 1;
force ace_medical_treatment_clearTraumaAfterBandage = true; // to increase the flow of the PvP match (reduce limping)
```

_more tbd_

## 3. Dependencies

{% include dependencies_list.md component="medical" %}
