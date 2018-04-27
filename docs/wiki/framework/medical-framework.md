---
layout: wiki
title: Medical Framework
description: Lists functions and variables for the medical system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---
## 1. Functions

### 1.1 fnc_setUnconscious

`ace_medical_fnc_setUnconscious`

```cpp
/*
 * Sets a unit in the unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> (default: true)
 * 2: Minimum unconscious time <NUMBER> (default: (round(random(10)+5)))
 * 3: Force AI Unconscious (skip random death chance) <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ace_medical_fnc_setUnconscious;
 */
```

### 1.2 fnc_setDead

`ace_medical_fnc_setDead`

```cpp
/*
 * Either kills a unit or puts the unit in a revivable state, depending on the settings.
 *
 * Arguments:
 * 0: The unit that will be killed <OBJECT>
 * 1: Force Dead (ignore revive setting) <BOOL> (default: false)
 * 1: Delay setDamage for a frame  <BOOL> (default: false)
 *
 * Return Value:
 * Did he died? <BOOL>
 *
 * Example:
 * [bob, false, false] call ace_medical_fnc_setDead
 */
```

### 1.3 fnc_setCardiacArrest

`ace_medical_fnc_setCardiacArrest`

```cpp
/*
 * Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies.
 * Timer is a random value between 120 and 720 seconds.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_medical_fnc_setCardiacArrest
 */
```


## 2. Variables

### 2.1 Unit Unconsciousness

- Determines if a unit should have AI unconsciousness forcefully enabled.
SetVar: `"ace_medical_enableUnconsciousnessAI"` - true/false or nil
- false: Disabled
- true: Enabled
- nil: Follow global `Enable Unconsciousness` setting

Examples:
```cpp
bob setVariable ["ace_medical_enableUnconsciousnessAI",true,true]
bob setVariable ["ace_medical_enableUnconsciousnessAI",false,true]
bob setVariable ["ace_medical_enableUnconsciousnessAI",nil,true]
```
