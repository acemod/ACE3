---
layout: wiki
title: Missile Guidance Framework
description: The ACE3 Missile Guidance Framework provides a setup of configuration settings, functions and a execution framework for mod makers to integrate with the missile guidance and targeting mechanisms of ACE3.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

The ACE3 Advanced Missile Guidance Framework provides a setup of configuration settings, functions and an execution framework for mod makers to integrate with the missile guidance and targeting mechanisms of ACE3. It also provides the mod makers to create their own custom guidance methods within the framework.

The framework provides all the functionality needed for guidance; from laser locking, target specification and selection, to handling the fired events and tracking and steering the vehicle based on provided parameters. This way, all that needs to be defined in mods is the appropriate `CfgAmmo` entries for the missile.

The framework also provides mod makers and scripters with the ability to configure custom seeker types and attack profiles, which are defined below. This allows for complete control of the guidance, locking and flight of a missile at the discretion of the mod maker.

ACE3 provides a full suite of base concepts and guidance for the majority of modern missile weaponry avialable today; these includes all basic types of seekers (SALH, SACLOS, Optic, Thermal ...) as well as the different common attack profiles utilized with guided munitions (such as top-down attack).

Finally, flight profiles and mechanics for realistic missile simulations are also implemented; allowing for lock-steering bump guidance flight such as with the M47 Dragon or GBU steering fins, or finely tuned direct flight guidance which is currently available with other missile types.


## 2. Components

The framework is broken up into 3 major components: Navigation Types, Seeker Types and Attack Profiles. In combination, these components build out the entire process of launching, locking and going terminal flight against targets.

#### 2.1 Navigation Types
Navigation types define how the missile flies to the designated target. ACE 3 implements the most common ones in use, Proportional Navigation, Augmented Proportional Navigation, and Zero-Effort Miss. These navigation types give an acceleration command to the missile who attempts to satisfy the command by adjusting its pitch and yaw to fly to the target.

#### 2.2 Seeker Types
Each seeker is generally assumed to be the logic for the seeker head unit within any given munition. Seekers within this framework provide the basic targeting functionality for the entire framework. The locking type will provide a generic target to the seeker, or the seeker may aquire a target on its own. The seeker then provides a target, either an object or a ASL position, which is then passed further into the framework. This target (or position) should be the actual current target position for the missiles flight. Seekers are required to perform all limitations and checks within their systems, although various limitations have been provided in this framework such as LOS FOV, laser guidance, etc.

#### 2.3 Attack Profiles

An attack profile adjusts the current target flight location to create the actual flight path of the missile. The attack profile is provided with all parameters of the system, including the returned target of the seeker. Using this information, the attack profile then will adjust the *direct flight target position* to specifically direct where and how the missile shall flight.


## 3. How it all ties together

The system is executed in a linear series of calls to each step of the process, and feeding back the return from that step to the next step. Execution is conducted using Seeker -> Profile -> Navigation, iteratively every frame of execution. Flight times are adjusted to `accTime` values and FPS lag, giving consistent flight.

On each step of execution, the seeker finds and returns the position of its target (ASL) and, optionally, sets target data specifying the target's direction from the missile, range, velocity and acceleration (if able). Then, this data is passed to the attack profile, which then returns an "adjusted attack position" (ASL), which is the location the missile should *currently* be homing on for flight. Finally, the navigation system processes the seeker's data about the target and returns a "Commanded Acceleration" vector which the missile attempts to satisfy.

In the simplest sense, the entire system provides the flight trajectory of the missile homing directly on the "adjusted attack position"; thus, an attack profile would ajust this position to direct the missile.  For example, top down attacks return the adjusted attack position high above the target, until entering their terminal stages, which then changes the position to be directly on top of the target - thus "walking the missile" along its flight path and to the impact.


## 4. Config Values

### 4.1 Enabling guidance on Ammo Types

```cpp
class CfgAmmo {
    class MyMissile {
        manualControl = 0;  // Turn off vanilla crosshair guidance

        // Begin ACE guidance Configs
        class ace_missileguidance {
            enabled = 1; // Explicit enabling of the system

            pitchRate = 30; // How many degrees/second the missile can pitch
            yawRate = 30; // How many degrees/second this missile can yaw

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SALH"; // Default seeker type
            seekerTypes[] = { "SALH", "LIDAR", "SARH", "Optic", "Thermal", "GPS", "SACLOS", "MCLOS" };

            defaultSeekerLockMode = "LOAL"; // Default lock mode
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "Direct"; // Default navigation type
            navigationTypes[] = { "Direct", "ZeroEffortMiss" }; // Navigation types this missile can use

            seekLastTargetPos = 1;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 70;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 1;         // Minimum range from the missile which the seeker can visually search
            seekerMaxRange = 8000;      // Maximum range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "hellfire"; // Default attack profile
            attackProfiles[] = {"hellfire", "hellfire_hi", "hellfire_lo"}; // Possible attack profiles

            // State machine defining what navigation type to use in this missiles phase
            class navigationStates {
                class initial {
                    transitionCondition = "my_fnc_navigationTransition"; // Condition needed to transition to next state
                    navigationType = "Direct"; // Navigation type to use in this state
                };
                class terminal {
                    transitionCondition = "";
                    navigationType = "ZeroEffortMiss";
                };
                // transitions from initial -> termimal
                states[] = {"initial", "terminal"};
            };
        };
```

### 4.2 Custom Seeker Types

```cpp
class ace_missileguidance_seekerTypes {
    class MySeekerType {
        name = "";  // Name
        visualName = "";  // Visual name
        description = "";  // Description

        functionName = "my_fnc_doSeekerType";  // Function that handles the seeker type
        onFired = "my_fnc_onFired"; // Function that runs when the missile is fired using this seeker
    };
};
```

### 4.3 Custom Attack Profiles

```cpp
class ace_missileguidance_attackProfiles {
    class MyAttackProfile {
        name = "";  // Name
        visualName = "";  // Visual name
        description = "";  // Description

        functionName = "my_fnc_doAttackProfile";  // Function that handles the attack profile
        onFired = "my_fnc_onFired"; // Function that runs when missile is fired using this attack profile
    };
};
```

### 4.4 Custom Navigation Type
```cpp
class ace_missileguidance_navigationTypes {
    class MyNavigationProfile {
        functionName = "my_fnc_navigation"; // Function to run for navigation
        onFired = "my_fnc_onFired"; // Function to run when the missile is fired with this navigation type
    };
};
```

## 5. Migrating From Old Missile Guidance

There are a few changes existing missiles need to implement to work with the new framework. Although sensible defaults are used, they may not be sufficient for all users

### 5.1 Turn Rate

`minDeflection`, `maxDeflection`, and `incDeflection` are all deprecated. These values were never used before, and had no meaning. The new system one should use is through `pitchRate` and `yawRate`: these describe the missiles rotation in pitch and yaw in degrees/second

### 5.2 Navigation

Missiles before didn't have any navigation logic. The new framework utilizes a navigation autopilot to guide the missile. You must add `defaultNavigationType`, `navigationTypes` and `navigationGain` to your missiles.

### 5.2.1 Available Navigation Types

| Navigation Name | Description | Use Case | Caveats |
| ---------- | ----------- | ------------------- | ------- |
| `Direct` | Adjusts missile direction so it is always pointing at the target | If you have a static target that doesn't need movement prediction | N/A |
| `Line` | Attempts to drive missile so the direction to the target is zero | Any missile which needs to follow a line | Can only be used with some seekers |
| `LineOfSight` | Accelerations missile to null-out the line-of-sight rate of change to try and intercept target | Old missiles which have a low-hit rate that predict target motion | N/A |
| `ProportionalNavigation` | Adjusts missile to enter collision course with target | Missiles which intercept by predicting target motion | N/A |
| `AugmentedProportionalNavigation` | Adjusts missile to enter collision course with target while taking into account target acceleration to reduce energy loss | Missiles which intercept by predicting target motion | N/A |
| `ZeroEffortMiss` | Adjusts missile to enter collision course with target with minimal energy loss | Missiles which intercept by predicting target motion | N/A |

## 6. Events

### 6.1 Listenable

| Event Name | Description | Passed Parameter(s) | Locality |
| ---------- | ----------- | ------------------- | -------- |
| `ace_missileguidance_handoff` | Missile handed off | `[_target, _args]` | Global |
