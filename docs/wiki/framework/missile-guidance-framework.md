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

The framework is broken up into 3 major components: Locking Types, Seeker Types and Attack Profiles. In combination, these components build out the entire process of launching, locking and going terminal flight against targets.

#### 2.1 Locking Types
Locking types provide the basic functionality of targeting which will be based to a seeker type, providing target acquisition for seekers. This provides the basic functionality for providing pre-determined targets for a seeker, or allowing the seeker to perform its own target acquisition and locking. Additionally, the seeker may reference back into the locking type in order to re-perform target acquisition.

#### 2.2 Seeker Types
Each seeker is generally assumed to be the logic for the seeker head unit within any given munition. Seekers within this framework provide the basic targeting functionality for the entire framework. The locking type will provide a generic target to the seeker, or the seeker may aquire a target on its own. The seeker then provides a target, either an object or a ASL position, which is then passed further into the framework. This target (or position) should be the actual current target position for the missiles flight. Seekers are required to perform all limitations and checks within their systems, although various limitations have been provided in this framework such as LOS FOV, laser guidance, etc.

#### 2.3 Attack Profiles

An attack profile adjusts the current target flight location to create the actual flight path of the missile. The attack profile is provided with all parameters of the system, including the returned target of the seeker. Using this information, the attack profile then will adjust the *direct flight target position* to specifically direct where and how the missile shall flight.


## 3. How it all ties together

The system is executed in a linear series of calls to each step of the process, and feeding back the return from that step to the next step. Execution is conducted using Locking -> Seeker -> Profile, iteratively every frame of execution. Flight times are adjusted to `accTime` values and FPS lag, giving consistent flight.

On each step of execution, a target specification array `[targetObj, targetPos]` is passed to the locking type, which then will return a possible modified target array. Next, this modified data is passed to the seeker type - which then, in turn, returns a position vector to the current "seeked" target position (ASL). Last, this target position is passed to the attack profile, which then returns an "adjusted attack position" (ASL), which is the location the missile should *currently* be homing on for flight.

In the simplest sense, the entire system provides the flight trajectory of the missile homing directly on the "adjusted attack position"; thus, an attack profile would ajust this position to direct the missile.  For example, top down attacks return the adjusted attack position high above the target, until entering their terminal stages, which then changes the position to be directly on top of the target - thus "walking the missile" along its flight path and to the impact.


## 4. Config Values

### 4.1 Enabling guidance on Ammo Types

```cpp
class CfgAmmo {
    class MyMissile {
        manualControl = 0;  // Turn off vanilla crosshair guidance

        // Begin ACE guidance Configs
        class ace_missileguidance {
            enabled = 1; // Enable missile guidance (0-disabled, 1-enabled)

            minDeflection = 0.00025;  // Minimum flap deflection for guidance
            maxDeflection = 0.001;  // Maximum flap deflection for guidance
            incDeflection = 0.0005;  // The increment in which deflection adjusts

            canVanillaLock = 0;  // Enable vanilla lock, only applicable to non-cadet modes, 'recruit' always uses vanilla locking (0-disabled, 1-enabled)

            defaultSeekerType = "SALH";  // Default seeker type
            seekerTypes[] = {"SALH", "LIDAR", "SARH", "Optic", "Thermal", "GPS", "SACLOS", "MCLOS"};  // Seeker types available

            defaultSeekerLockMode = "LOAL";  // Default seeker lock mode
            seekerLockModes[] = {"LOAL", "LOBL"};  // Seeker lock modes available

            seekerAngle = 90;  // Angle in front of the missile which can be searched
            seekerAccuracy = 1;  // Seeker accuracy multiplier

            seekerMinRange = 1;  // Minimum range from the missile which the seeker can visually search
            seekerMaxRange = 2500;  // Maximum from the missile which the seeker can visually search

            defaultAttackProfile = "LIN";  // Default attack profile
            attackProfiles[] = {"LIN", "DIR", "MID", "HI"};  // Attack profiles available
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
    };
};
```

## 5. Events

### 5.1 Listenable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`ace_missileguidance_handoff` | Missile handed off | `[_target, _args]` | Global
