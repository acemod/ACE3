---
layout: wiki
title: Grenades Framework
description: Explains how to set-up incendiary, flares and flashbangs, particularly multi-bangs.
group: framework
parent: wiki
order: 7
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Overview

ACE provides a simple interface for creating incendiary, flare and flashbang grenades, as well as specifying their properties. For flashbangs, it is important that one sets `timeToLive` to be greater than the total possible time until the last explosion, i.e, `ace_grenades_flashbangBangs * ace_grenades_flashbangInterval + ace_grenades_flashbangIntervalMaxDeviation`. Any explosions that occur after the `timeToLive` has expired will occur at `(0,0)`.


## 2. Config Values

### 2.1 Flashbang Config Values
There are several config entries specific to ACE flashbangs. All successive values can be left undefined and they will be given the defaults shown in the first example below, with the exception of `ace_grenades_flashbang`, which is equal to `0` if left undefined.

```cpp
class CfgAmmo {
    class MyDefaultFlashbang {
        ace_grenades_flashbang = 1;                         // A flashbang
        ace_grenades_flashbangBangs = 1;                    // with one bang
        ace_grenades_flashbangInterval = 0.5;               // 0.5 seconds between each subsequent bang
        ace_grenades_flashbangIntervalMaxDeviation = 0.1;   // Deviation of up to ± 0.1 seconds on each fuse
    };
    class ACE_G_M84 {
        explosionTime = 2.3;            // Seconds until the initial explosion
        timeToLive = 6;                 // Seconds until the projectile is removed
        ace_grenades_flashbang = 1;     // A normal flashbang
    };
    class ACE_G_CTS9 {
        explosionTime = 1.5;
        timeToLive = 10;
        ace_grenades_flashbang = 1;
        ace_grenades_flashbangBangs = 9;                                        // 9 bangs
        ace_grenades_flashbangInterval = 0.5;                                   // 0.5 seconds between each subsequent bang
        ace_grenades_flashbangIntervalMaxDeviation = "0.1 * sqrt (12*4) / 2";   // Standard deviation of 0.1 seconds on each fuse
    };
    class 16aa_Ammo_6Bang {                                 // British Armed Forces L107A1
        explosionTime = 1;
        timeToLive = 5;
        ace_grenades_flashbang = 1;
        ace_grenades_flashbangBangs = 6;                    // 6 bangs
        ace_grenades_flashbangInterval = 0.25;              // 0.25 seconds between each subsequent bang
        ace_grenades_flashbangIntervalMaxDeviation = 0.05;  // Deviation of up to ± 0.05 seconds on each fuse
        ace_grenades_flashbangExplodeSound[] = {            // Sound that is played upon detonation
            {"A3\Sounds_F\arsenal\explosives\grenades\Explosion_HE_grenade_01.wss", 5, 1.2, 400}, // file path, volume, pitch, max distance
            {"A3\Sounds_F\arsenal\explosives\grenades\Explosion_HE_grenade_02.wss", 5, 1.2, 400}
        };
    };
};
```

#### 2.1.1 ace_grenades_flashbang

If set to zero or left undefined, the grenade is not treated as a flashbang. If it is set to 1, the grenade will be treated as a flashbang with the associated effects.

#### 2.1.2 ace_grenades_flashbangBangs

The flashbang will explode as many times as is specified. The default is 1.

#### 2.1.3 ace_grenades_flashbangInterval

The average amount of time in seconds, after `explosionTime` has passed, between each subsequent bang.

#### 2.1.4 ace_grenades_flashbangIntervalMaxDeviation

The amount of randomness in the fuse time.

#### 2.1.5 ace_grenades_flashbangExplodeSound

The sounds that can be used when the flashbang detonates. It randomly selects an entry from this array (equal chances, there are no weights involved).
If not defined, `[format ["A3\Sounds_F\arsenal\explosives\grenades\Explosion_HE_grenade_0%1.wss", floor (random 4) + 1], 5, 1.2, 400]` is used as a default instead (4 sounds total).

### 2.2 Incendiary Config Values

```cpp
class CfgAmmo {
    class ACE_G_M14 {
        ace_grenades_incendiary = 1;
    };
};
```

#### 2.2.1 ace_grenades_incendiary

If set to zero or left undefined, the grenade is not treated as an incendiary. If it is set to 1, the grenade will be treated as an incendiary with the associated effects.

### 2.3 Flare Config Values

```cpp
class CfgAmmo {
    class ACE_G_Handflare_White {
        ace_grenades_flare = 1;
        ace_grenades_color[] = {0.5,0.5,0.5,0.5}; // R, G, B, light intensity
    };
};
```

#### 2.3.1 ace_grenades_flare

If set to zero or left undefined, the grenade is not treated as a flare. If it is set to 1, the grenade will be treated as a flare with the associated effects.

#### 2.3.2 ace_grenades_color

Sets the color of the emitted light. The first 3 values of the array of the color, the last is the light intensity.

### 2.4 Grenade Rolling

#### 2.4.1 ace_grenades_rollVectorDirAndUp

Sets the `setVectorDirAndUp` of the grenade when the grenade is rolled.

## 3. Events

### 3.1 Listenable

| Event Name | Description | Passed Parameter(s) | Locality |
| ---------- | ----------- | ------------------- | -------- |
| `ace_flashbangExploded` | A flashbang exploded | `[_grenadePosASL]` | Global |
| `ace_grenades_flashbangedAI` | A local AI was affected by a flashbang | `[_unit, _strength, _grenadePosASL]` | Local |
| `ace_grenades_flashbangedPlayer` | The local player was affected by a flashbang | `[_strength, _grenadePosASL]` | Local |
